//
//  AkuratecoCardFormatter.swift
//  AkuratecoSDK
//
//  Created by Bodia on 15.02.2021.
//

import Foundation

final class AkuratecoCardFormatter {
    
    private let monthFormatter = NumberFormatter()
    private let yearFormatter = NumberFormatter()
    
    init() {
        monthFormatter.minimumIntegerDigits = 2
        monthFormatter.maximumIntegerDigits = 2
        
        yearFormatter.minimumIntegerDigits = 4
        yearFormatter.maximumIntegerDigits = 4
    }
    
    func expireMonthFormat(for card: AkuratecoCard) -> String? {
        monthFormatter.string(from: NSNumber(value: card.expireMonth))
    }
    
    func expireYearFormat(for card: AkuratecoCard) -> String? {
        yearFormatter.string(from: NSNumber(value: card.expireYear))
    }
}
