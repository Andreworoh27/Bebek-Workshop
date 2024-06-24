//
//  ReaderViewContainer.swift
//  BebekWorkshop
//
//  Created by Andrew Oroh on 24/06/24.
//

import SwiftUI
import ReadiumNavigator
import UIKit

struct ReaderViewContainer: UIViewControllerRepresentable {
    var vc: EPUBNavigatorViewController?
    
    func makeUIViewController(context: Context) -> UIViewController {
        let viewController = UIViewController()
//        DispatchQueue.main.async {
//            self.onAppear(viewController)
//        }
        if let vc {
            vc.view.frame = UIScreen.main.bounds
            return vc
        }
        else { return viewController }
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}
