//
//  AkuratecoSaleDecline.swift
//  AkuratecoSDK
//
//  Created by Bodia on 08.03.2021.
//

import Foundation

/// The SALE decline result of the *AkuratecoSaleResult*.
///
/// See *AkuratecoSaleResponse*
public struct AkuratecoSaleDecline: DetailsAkuratecoResultProtocol {
  
    public let transactionDate: Date
    
    public let descriptor: String?
    
    public let orderAmount: Double
    
    public let orderCurrency: String
    
    public let action: AkuratecoAction
    
    public let result: AkuratecoResult
    
    public let status: AkuratecoStatus
    
    public let orderId: String
    
    public let transactionId: String
    
    /// Description of the cancellation of the transaction.
    public let declineReason: String
}

extension AkuratecoSaleDecline: Decodable {
    enum CodingKeys: String, CodingKey {
        case descriptor, action, result, status
        case transactionDate = "trans_date"
        case orderAmount = "amount"
        case orderCurrency = "currency"
        case orderId = "order_id"
        case transactionId = "trans_id"
        case declineReason = "decline_reason"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
       
        orderCurrency = try container.decode(String.self, forKey: .orderCurrency)
        action = try container.decode(AkuratecoAction.self, forKey: .action)
        result = try container.decode(AkuratecoResult.self, forKey: .result)
        status = try container.decode(AkuratecoStatus.self, forKey: .status)
        orderId = try container.decode(String.self, forKey: .orderId)
        transactionId = try container.decode(String.self, forKey: .transactionId)
        declineReason = try container.decode(String.self, forKey: .declineReason)
        
        orderAmount = Double(try container.decode(String.self, forKey: .orderAmount)) ?? 0
        transactionDate = AkuratecoDateFormatter.date(from: try container.decode(String.self, forKey: .transactionDate)) ?? Date()

        descriptor = try container.decodeIfPresent(String.self, forKey: .descriptor)
    }
}
