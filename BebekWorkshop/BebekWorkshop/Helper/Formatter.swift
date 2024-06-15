//
//  Formatter.swift
//  BebekWorkshop
//
//  Created by Alfadli Maulana Siddik on 15/06/24.
//

import Foundation

extension Date {
    func toString(format: String = "yyyy-MM-dd HH:mm:ss") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}
