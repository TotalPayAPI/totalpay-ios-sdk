//
//  AkuratecoOption.swift
//  AkuratecoSDK
//
//  Created by Bodia on 15.02.2021.
//

import Foundation

enum AkuratecoOption: String, Encodable {
    case yes = "Y"
    case no = "N"
    
    init(_ boolValue: Bool) {
        self = boolValue ? .yes : .no
    }
}
