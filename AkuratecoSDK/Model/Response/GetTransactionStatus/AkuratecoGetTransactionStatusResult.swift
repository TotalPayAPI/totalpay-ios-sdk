//
//  AkuratecoGetTransactionStatusResult.swift
//  AkuratecoSDK
//
//  Created by Bodia on 09.03.2021.
//

import Foundation

/// The callback of the *AkuratecoGetTransactionStatusAdapter*.
///
/// See *AkuratecoCallback*
public typealias AkuratecoGetTransactionStatusCallback = AkuratecoCallback<AkuratecoGetTransactionStatusResult>

/// The result of the *AkuratecoGetTransactionStatusAdapter*.
public enum AkuratecoGetTransactionStatusResult: Decodable {
    
    /// Success result.
    case success(AkuratecoGetTransactionStatusSuccess)
    
    /// Actual value: *AkuratecoGetTransactionStatusSuccess*
    public var result: AkuratecoResultProtocol {
        switch self {
        case .success(let result): return result
        }
    }
    
    public init(from decoder: Decoder) throws {
        self = try AkuratecoGetTransactionStatusDeserializer().decode(from: decoder)
    }
}
