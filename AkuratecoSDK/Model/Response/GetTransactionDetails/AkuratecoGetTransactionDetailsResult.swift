//
//  AkuratecoGetTransactionDetailsResult.swift
//  AkuratecoSDK
//
//  Created by Bodia on 09.03.2021.
//

import Foundation

/// The callback of the *AkuratecoGetTransactionDetailsAdapter*.
/// 
/// @see *AkuratecoCallback*
public typealias AkuratecoGetTransactionDetailsCallback = AkuratecoCallback<AkuratecoGetTransactionDetailsResult>

/// The result of the *AkuratecoGetTransactionDetailsAdapter*.
public enum AkuratecoGetTransactionDetailsResult: Decodable {
    
    /// Success result.
    case success(AkuratecoGetTransactionDetailsSuccess)
    
    /// Actual value: *AkuratecoGetTransactionDetailsSuccess*
    public var result: OrderAkuratecoResultProtocol {
        switch self {
        case .success(let result): return result
        }
    }
    
    public init(from decoder: Decoder) throws {
        self = try AkuratecoGetTransactionDetailsDeserializer().decode(from: decoder)
    }
}
