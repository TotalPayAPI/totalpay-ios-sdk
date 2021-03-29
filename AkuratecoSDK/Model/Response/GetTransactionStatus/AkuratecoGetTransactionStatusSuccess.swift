//
//  AkuratecoGetTransactionStatusSuccess.swift
//  AkuratecoSDK
//
//  Created by Bodia on 09.03.2021.
//

import Foundation

/// The GET_TRANS_STATUS success result of the *AkuratecoGetTransactionStatusResult*.
///
/// See *AkuratecoGetTransactionStatusResponse*
public struct AkuratecoGetTransactionStatusSuccess: AkuratecoResultProtocol {
    public let action: AkuratecoAction
    public let result: AkuratecoResult
    public let status: AkuratecoStatus
    public let orderId: String
    public let transactionId: String
}

extension AkuratecoGetTransactionStatusSuccess: Decodable {
    enum CodingKeys: String, CodingKey {
        case action, result, status
        case orderId = "order_id"
        case transactionId = "trans_id"
    }
}
