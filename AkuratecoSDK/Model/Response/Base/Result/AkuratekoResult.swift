//
//  AkuratekoResult.swift
//  AkuratecoSDK
//
//  Created by Bodia on 08.03.2021.
//

import Foundation

/// The base response result data holder description.
///
/// See *AkuratecoResponse*
public protocol AkuratecoResultProtocol {
    
    /// The action of the transaction.
    var action: AkuratecoAction { get }
    
    /// The result of the transaction.
    var result: AkuratecoResult { get }
    
    /// The status of the transaction.
    var status: AkuratecoStatus { get }
    
    /// Transaction ID in the Merchant’s system.
    var orderId: String { get }
    
    /// Transaction ID in the Payment Platform.
    var transactionId: String { get }
}
