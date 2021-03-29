//
//  AkuratecoCaptureResult.swift
//  AkuratecoSDK
//
//  Created by Bodia on 08.03.2021.
//

import Foundation

/// The callback of the *AkuratecoCaptureAdapter*.
///
/// See *AkuratecoCallback*
public typealias AkuratecoCaptureCallback = AkuratecoCallback<AkuratecoCaptureResult>

/// The result of the *AkuratecoCaptureAdapter*.
public enum AkuratecoCaptureResult: Decodable {
    
    /// Success result.
    case success(AkuratecoCaptureSuccess)
    
    /// Decline result.
    case decline(AkuratecoSaleDecline)
    
    /// Actual result value: *AkuratecoCaptureSuccess* or *AkuratecoSaleDecline*
    public var result: DetailsAkuratecoResultProtocol {
        switch self {
        case .success(let result): return result
        case .decline(let result): return result
        }
    }
    
    public init(from decoder: Decoder) throws {
        self = try AkuratecoCaptureDeserializer().decode(from: decoder)
    }
}
