//
//  AkuratecoPayerOptionsFormatter.swift
//  AkuratecoSDK
//
//  Created by Bodia on 15.02.2021.
//

import Foundation

final class AkuratecoPayerOptionsFormatter {

    private let birthdateFormat = DateFormatter()

    init() {
        birthdateFormat.locale = .init(identifier: "us")
        birthdateFormat.dateFormat = "yyyy-MM-dd"
    }
    
    func birthdateFormat(payerOptions: AkuratecoPayerOptions?) -> String? {
        guard let birthdate =  payerOptions?.birthdate else { return nil }
        
        return birthdateFormat.string(from:birthdate)
    }
}
