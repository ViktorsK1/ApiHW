//
//  String.swift
//  ApiHW
//
//  Created by Виктор Куля on 03.04.2022.
//

import Foundation

extension String {
    /// returns string without HTML tags
    public var plainText: String {
        replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
}
