//
//  AkuratecoTransaction.swift
//  AkuratecoSDK
//
//  Created by Bodia on 09.03.2021.
//

import Foundation

/// The transaction data holder.
/// 
/// See *AkuratecoGetTransactionDetailsSuccess*
public struct AkuratecoTransaction {
    
    /// Transaction date.
    public let date: Date
    
    /// Transaction type (sale, 3ds, auth, capture, chargeback, reversal, refund).
    public let type: AkuratecoTransactionType
    
    /// Transaction status (0-fail, 1-success).
    public let status: AkuratecoTransactionStatus
    
    /// Transaction amount.
    public let amount: Double
}

extension AkuratecoTransaction: Decodable {
    enum CodingKeys: String, CodingKey {
        case date, type, status, amount
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        type = try container.decode(AkuratecoTransactionType.self, forKey: .type)
        status = try container.decode(AkuratecoTransactionStatus.self, forKey: .status)
        
        amount = Double(try container.decode(String.self, forKey: .amount)) ?? 0
        date = AkuratecoDateFormatter.date(from: try container.decode(String.self, forKey: .date)) ?? Date()
    }
}
