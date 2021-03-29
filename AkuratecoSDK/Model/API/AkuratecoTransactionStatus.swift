//
//  AkuratecoTransactionStatus.swift
//  AkuratecoSDK
//
//  Created by Bodia on 15.02.2021.
//

import Foundation

/// The transaction status types.
/// 
/// See *AkuratecoTransaction*
public enum AkuratecoTransactionStatus: String, Decodable {
    
    /// Failed or "0" status.
    case fail
    
    /// Success or "1" status.
    case success
}
