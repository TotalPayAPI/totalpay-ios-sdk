//
//  AkuratecoCreditvoidSuccess.swift
//  AkuratecoSDK
//
//  Created by Bodia on 09.03.2021.
//

import Foundation

/// The CREDITVOID success result of the *AkuratecoCreditvoidResult*.
///
/// See *AkuratecoCreditvoidResponse*
public struct AkuratecoCreditvoidSuccess: AkuratecoResultProtocol {
    public let action: AkuratecoAction
    public let result: AkuratecoResult
    public let status: AkuratecoStatus
    public let orderId: String
    public let transactionId: String
}

extension AkuratecoCreditvoidSuccess: Decodable {
    enum CodingKeys: String, CodingKey {
        case action, result, status
        case orderId = "order_id"
        case transactionId = "trans_id"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        action = try container.decode(AkuratecoAction.self, forKey: .action)
        result = try container.decode(AkuratecoResult.self, forKey: .result)
        orderId = try container.decode(String.self, forKey: .orderId)
        transactionId = try container.decode(String.self, forKey: .transactionId)
        status = try container.decodeIfPresent(AkuratecoStatus.self, forKey: .status) ?? .undefined
    }
}
