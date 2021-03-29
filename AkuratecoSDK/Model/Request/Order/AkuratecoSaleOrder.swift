//
//  AkuratecoSaleOrder.swift
//  AkuratecoSDK
//
//  Created by Bodia on 15.02.2021.
//

import Foundation

/// The sale order data holder.
///
/// See *AkuratecoSaleAdapter, AkuratecoOrderProtocol*
public final class AkuratecoSaleOrder: AkuratecoOrder {
    
    /// The currency. 3-letter code.
    public var currency: String
    
    /// Create the sale order data holder.
    /// - Parameters:
    ///   - id: Transaction ID in the Merchants system. String up to 255 characters.
    ///   - amount: The amount of the transaction. Numbers in the form XXXX.XX (without leading zeros).
    ///   - currency: The currency. 3-letter code.
    ///   - description: Description of the transaction (product name). String up to 1024 characters.
    public init(id: String, amount: Double, currency: String, description: String) {
        self.currency = currency
        
        super.init(id: id, amount: amount, description: description)
    }
}
