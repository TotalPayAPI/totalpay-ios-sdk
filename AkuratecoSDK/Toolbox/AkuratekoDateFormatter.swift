//
//  AkuratekoDateFormatter.swift
//  AkuratecoSDK
//
//  Created by Bodia on 11.03.2021.
//

import Foundation

final class AkuratecoDateFormatter {
    private static let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-mm-dd hh:mm:ss"
        
        return formatter
    }()
    
    static func date(from string: String) -> Date? {
        formatter.date(from: string)
    }
}
