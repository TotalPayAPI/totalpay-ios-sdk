//
//  AkuratecoTransactionType.swift
//  AkuratecoSDK
//
//  Created by Bodia on 15.02.2021.
//

import Foundation

/// The transaction type types.
/// 
/// See *.AkuratecoTransaction*
public enum AkuratecoTransactionType: String, Codable {
    
    /// 3DS transaction type.
    case secure3d = "SECURE_3D"
    
    /// SALE transaction type.
    case sale = "SALE"
    
    /// AUTH transaction type.
    case auth = "AUTH"
    
    /// CAPTURE transaction type.
    case capture = "CAPTURE"
    
    /// REVERSAL transaction type.
    case reversal = "REVERSAL"
     
    /// REFUND transaction type.
    case refund = "REFUND"
    
    /// CHARGEBACK transaction type.
    case chargeback = "CHARGEBACK"
}
