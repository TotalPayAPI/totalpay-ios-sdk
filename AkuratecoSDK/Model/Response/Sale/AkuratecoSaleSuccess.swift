//
//  AkuratecoSaleSuccess.swift
//  AkuratecoSDK
//
//  Created by Bodia on 09.03.2021.
//

import Foundation

/// The SALE success result of the *AkuratecoSaleResult*.
///
/// See *AkuratecoSaleResponse*
public struct AkuratecoSaleSuccess: DetailsAkuratecoResultProtocol {
    
    public let action: AkuratecoAction
    
    public let result: AkuratecoResult
    
    public let status: AkuratecoStatus
    
    public let orderId: String
    
    public let transactionId: String
    
    public let transactionDate: Date
    
    public let descriptor: String?
    
    public let orderAmount: Double
    
    public let orderCurrency: String
}

extension AkuratecoSaleSuccess: Decodable {
    enum CodingKeys: String, CodingKey {
        case action, result, status, descriptor
        case orderId = "order_id"
        case transactionId = "trans_id"
        case transactionDate = "trans_date"
        case orderAmount = "amount"
        case orderCurrency = "currency"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        action = try container.decode(AkuratecoAction.self, forKey: .action)
        result = try container.decode(AkuratecoResult.self, forKey: .result)
        status = try container.decode(AkuratecoStatus.self, forKey: .status)
        orderId = try container.decode(String.self, forKey: .orderId)
        transactionId = try container.decode(String.self, forKey: .transactionId)
        orderCurrency = try container.decode(String.self, forKey: .orderCurrency)
        
        orderAmount = Double(try container.decode(String.self, forKey: .orderAmount)) ?? 0
        transactionDate = AkuratecoDateFormatter.date(from: try container.decode(String.self, forKey: .transactionDate)) ?? Date()

        descriptor = try container.decodeIfPresent(String.self, forKey: .descriptor)
    }
}
