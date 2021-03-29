//
//  AkuratecoCaptureSuccess.swift
//  AkuratecoSDK
//
//  Created by Bodia on 08.03.2021.
//

import Foundation

/// The CAPTURE success result of the *AkuratecoCaptureResult*.
/// 
/// See *AkuratecoCaptureResponse*
public struct AkuratecoCaptureSuccess: DetailsAkuratecoResultProtocol {
    public let transactionDate: Date
    
    public let descriptor: String?
    
    public let orderAmount: Double
    
    public let orderCurrency: String
    
    public let action: AkuratecoAction
    
    public let result: AkuratecoResult
    
    public let status: AkuratecoStatus
    
    public let orderId: String
    
    public let transactionId: String
}

extension AkuratecoCaptureSuccess: Decodable {
    enum CodingKeys: String, CodingKey {
        case descriptor
        case transactionDate = "trans_date"
        case orderAmount = "amount"
        case orderCurrency = "currency"
        case action
        case result
        case status
        case orderId = "order_id"
        case transactionId = "trans_id"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        orderCurrency = try container.decode(String.self, forKey: .orderCurrency)
        action = try container.decode(AkuratecoAction.self, forKey: .action)
        result = try container.decode(AkuratecoResult.self, forKey: .result)
        status = try container.decode(AkuratecoStatus.self, forKey: .status)
        orderId = try container.decode(String.self, forKey: .orderId)
        transactionId = try container.decode(String.self, forKey: .transactionId)
        
        transactionDate = AkuratecoDateFormatter.date(from: try container.decode(String.self, forKey: .transactionDate)) ?? Date()
        orderAmount = Double(try container.decode(String.self, forKey: .orderAmount)) ?? 0
        
        descriptor = try container.decodeIfPresent(String.self, forKey: .descriptor)
    }
}
