//
//  AkuratecoGetTransactionDetailsService.swift
//  AkuratecoSDK
//
//  Created by Bodia on 09.03.2021.
//

import Foundation

/// GET_TRANS_DETAILS Service for the *AkuratecoGetTransactionDetailsAdapter*.
/// 
/// See *AkuratecoGetTransactionDetailsResponse*
///
/// Gets all history of transactions by the order.
public struct AkuratecoGetTransactionDetailsService: XWWWFormUrlEncodable {
    let action = AkuratecoAction.getTransDetails
    let clientKey = AkuratecoSDK.shared.credentials.clientKey
    let transactionId: String
    let hash: String
}

extension AkuratecoGetTransactionDetailsService: Encodable {
    enum CodingKeys: String, CodingKey {
        case hash, action
        case clientKey = "client_key"
        case transactionId = "trans_id"
    }
}
