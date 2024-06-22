//
//  BookServices.swift
//  BebekWorkshop
//
//  Created by Andrew Oroh on 22/06/24.
//

import Foundation
import ReadiumShared
import ReadiumStreamer

final class BookServices{
    /// Imports the publication at the given `url` to the bookshelf.
    ///
    /// If the `url` is a local file URL, the publication is copied to Documents/. For a remote URL,
    /// it is first downloaded.
    ///
    /// DRM services are used to fulfill the publication, in case the URL locates a licensing
    /// document.
    //    @discardableResult
    func importPublication(from sourceURL: AbsoluteURL, progress: @escaping (Double) -> Void = { _ in }) async throws -> Book{
        // Necessary to read URL exported from the Files app, for example.
        let shouldRelinquishAccess = sourceURL.url.startAccessingSecurityScopedResource()
        defer {
            if shouldRelinquishAccess {
                sourceURL.url.stopAccessingSecurityScopedResource()
            }
        }
        
        var url = sourceURL.fileURL!
        
        let (pub, mediaType) = try await openPublication(at: url, allowUserInteraction: false)
        
        let coverPath = try importCover(of: pub)
        
        url = try moveToDocuments(
            from: url,
            title: pub.metadata.title ?? url.lastPathSegment,
            mediaType: mediaType
        )
        
        let book = Book(
            identifier: pub.metadata.identifier,
            title: pub.metadata.title ?? url.lastPathSegment,
            authors: pub.metadata.authors
                .map(\.name)
                .joined(separator: ", "),
            type: mediaType.string,
            path: Paths.documents.relativize(url)!.string,
            coverPath: coverPath
        )
        
        return book
        //        return try await insertBook(at: url, publication: pub, mediaType: mediaType, coverPath: coverPath)
    }
    
    /// Opens the Readium 2 Publication for the given `book`.
    func openBook(_ book: Book) async throws -> Publication {
        let (pub, _) = try await openPublication(at: book.url(), allowUserInteraction: true)
        return pub
    }
    
    /// Opens the Readium 2 Publication at the given `url`.
    private func openPublication(at url: FileURL, allowUserInteraction: Bool) async throws -> (Publication, MediaType) {
        let asset = FileAsset(file: url)
        guard let mediaType = asset.mediaType() else {
            throw LibraryError.openFailed(Publication.OpeningError.unsupportedFormat)
        }
        
        let streamer = Streamer()
        
        return try await withCheckedThrowingContinuation { cont in
            streamer.open(asset: asset, allowUserInteraction: allowUserInteraction) { result in
                switch result {
                case let .success(publication):
                    cont.resume(returning: (publication, mediaType))
                case let .failure(error):
                    cont.resume(throwing: LibraryError.openFailed(error))
                case .cancelled:
                    cont.resume(throwing: LibraryError.cancelled)
                }
            }
        }
    }
    
    /// Moves the given `sourceURL` to the user Documents/ directory.
    private func moveToDocuments(from source: FileURL, title: String, mediaType: MediaType) throws -> FileURL {
        let destination = Paths.makeDocumentURL(title: title, mediaType: mediaType)
        
        do {
            // If the source file is part of the app folder, we can move it. Otherwise we make a
            // copy, to avoid deleting files from iCloud, for example.
            if Paths.isAppFile(at: source) {
                try FileManager.default.moveItem(at: source.url, to: destination.url)
            } else {
                try FileManager.default.copyItem(at: source.url, to: destination.url)
            }
            return destination
        } catch {
            throw LibraryError.importFailed(error)
        }
    }
    
    /// Imports the publication cover and return its path relative to the Covers/ folder.
    private func importCover(of publication: Publication) throws -> String? {
        guard let cover = publication.cover?.pngData() else {
            return nil
        }
        let coverURL = Paths.covers.appendingUniquePathComponent()
        
        do {
            try cover.write(to: coverURL.url)
            return coverURL.lastPathSegment
        } catch {
            throw LibraryError.importFailed(error)
        }
    }
}

private extension Book {
    func url() throws -> FileURL {
        guard let url = AnyURL(string: path) else {
            throw LibraryError.bookNotFound
        }
        
        switch url {
        case let .absolute(url):
            guard let url = url.fileURL else {
                throw LibraryError.bookNotFound
            }
            return url
            
        case let .relative(relativeURL):
            // Path relative to Documents/.
            guard let url = Paths.documents.resolve(relativeURL) else {
                throw LibraryError.bookNotFound
            }
            return url
        }
    }
}

