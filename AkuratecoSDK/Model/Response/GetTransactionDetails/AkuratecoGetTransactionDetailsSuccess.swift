//
//  AkuratecoGetTransactionDetailsSuccess.swift
//  AkuratecoSDK
//
//  Created by Bodia on 09.03.2021.
//

import Foundation

/// The GET_TRANS_DETAILS success result of the *AkuratecoGetTransactionDetailsResult*.
/// 
/// See *AkuratecoGetTransactionDetailsResponse, AkuratecoTransaction*
///
/// @property name
/// @property mail p
/// @property ip p
/// @property card p
/// @property transactions t
public struct AkuratecoGetTransactionDetailsSuccess: OrderAkuratecoResultProtocol {
  
    public let action: AkuratecoAction
    
    public let result: AkuratecoResult
    
    public let status: AkuratecoStatus
    
    public let orderId: String
    
    public let transactionId: String
    
    /// Payer name.
    public let name: String
    
    /// Payer mail.
    public let mail: String
    
    /// Payer IP.
    public let ip: String
    
    public let orderAmount: Double
    
    public let orderCurrency: String
    
    /// Payer card number. Format: XXXXXXXX****XXXX.
    public let card: String
    
    /// The *AkuratecoTransaction* list.
    public let transactions: [AkuratecoTransaction]
}

extension AkuratecoGetTransactionDetailsSuccess: Decodable {
    enum CodingKeys: String, CodingKey {
        case action, result, status, name, mail, ip, card, transactions
        case orderAmount = "amount"
        case orderCurrency = "currency"
        case orderId = "order_id"
        case transactionId = "trans_id"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        action = try container.decode(AkuratecoAction.self, forKey: .action)
        result = try container.decode(AkuratecoResult.self, forKey: .result)
        status = try container.decode(AkuratecoStatus.self, forKey: .status)
        orderId = try container.decode(String.self, forKey: .orderId)
        transactionId = try container.decode(String.self, forKey: .transactionId)
        name = try container.decode(String.self, forKey: .name)
        mail = try container.decode(String.self, forKey: .mail)
        ip = try container.decode(String.self, forKey: .ip)
        orderCurrency = try container.decode(String.self, forKey: .orderCurrency)
        card = try container.decode(String.self, forKey: .card)
        transactions = try container.decode([AkuratecoTransaction].self, forKey: .transactions)
        
        orderAmount = Double(try container.decode(String.self, forKey: .orderAmount)) ?? 0
    }
}
