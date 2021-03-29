//
//  AkuratecoCreditvoidResult.swift
//  AkuratecoSDK
//
//  Created by Bodia on 09.03.2021.
//

import Foundation

/// The callback of the *AkuratecoCreditvoidAdapter*.
///
/// See *AkuratecoCallback*
public typealias AkuratecoCreditvoidCallback = AkuratecoCallback<AkuratecoCreditvoidResult>

/// The result of the*AkuratecoCreditvoidAdapter*.
public enum AkuratecoCreditvoidResult: Decodable {
    
    /// Success result.
    case success(AkuratecoCreditvoidSuccess)
    
    /// Actual value: *AkuratecoCreditvoidSuccess*.
    public var result: AkuratecoResultProtocol {
        switch self {
        case .success(let result): return result
        }
    }
    
    public init(from decoder: Decoder) throws {
        self = try AkuratecoCreditvoidDeserializer().decode(from: decoder)
    }
}
