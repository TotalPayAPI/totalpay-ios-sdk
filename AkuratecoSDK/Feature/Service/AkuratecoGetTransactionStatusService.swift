//
//  AkuratecoGetTransactionStatusService.swift
//  AkuratecoSDK
//
//  Created by Bodia on 09.03.2021.
//

import Foundation

/// GET_TRANS_STATUS Service for the *AkuratecoGetTransactionStatusAdapter*.
/// 
/// See *AkuratecoGetTransactionStatusResponse*
///
/// Gets order status from Payment Platform.
public struct AkuratecoGetTransactionStatusService: XWWWFormUrlEncodable {
    let action = AkuratecoAction.getTransStatus
    let clientKey = AkuratecoSDK.shared.credentials.clientKey
    let transactionId: String
    let hash: String
}

extension AkuratecoGetTransactionStatusService: Encodable {
    enum CodingKeys: String, CodingKey {
        case hash, action
        case clientKey = "client_key"
        case transactionId = "trans_id"
    }
}
