//
//  AkuratecoSaleResult.swift
//  AkuratecoSDK
//
//  Created by Bodia on 09.03.2021.
//

import Foundation

/// The callback of the *AkuratecoSaleAdapter*.
/// See *AkuratecoCallback*
public typealias AkuratecoSaleCallback = AkuratecoCallback<AkuratecoSaleResult>

/// The result of the *AkuratecoSaleAdapter*.
public enum AkuratecoSaleResult: Decodable {
    
    /// Success result.
    case success(AkuratecoSaleSuccess)
    
    /// Decline result.
    case decline(AkuratecoSaleDecline)
    
    /// Recurring Init result.
    case recurring(AkuratecoSaleRecurring)
    
    /// 3DS result.
    case secure3d(AkuratecoSale3ds)
    
    /// Actual value: *AkuratecoSaleSuccess* or *AkuratecoSaleDecline* or *AkuratecoSaleRecurring* or *AkuratecoSale3ds*
    public var result: DetailsAkuratecoResultProtocol {
        switch self {
        case .success(let result): return result
        case .decline(let result): return result
        case .recurring(let result): return result
        case .secure3d(let result): return result
        }
    }
    
    public init(from decoder: Decoder) throws {
        self = try AkuratecoSaleDeserializer().decode(from: decoder)
    }
}
