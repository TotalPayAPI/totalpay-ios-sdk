//
//  AkuratecoCaptureService.swift
//  AkuratecoSDK
//
//  Created by Bodia on 09.03.2021.
//

import Foundation

/// CAPTURE Service for the *AkuratecoCaptureAdapter*.
///
/// See *AkuratecoCaptureResponse*
///
/// CAPTURE request is used to submit previously authorized transaction (created by SALE request with parameter auth = Y). Hold funds will be transferred to Merchants account.
public struct AkuratecoCaptureService: XWWWFormUrlEncodable {
    let action = AkuratecoAction.capture
    let clientKey = AkuratecoSDK.shared.credentials.clientKey
    let transactionId: String
    let amount: String?
    let hash: String
}

extension AkuratecoCaptureService: Encodable {
    enum CodingKeys: String, CodingKey {
        case amount, hash, action
        case clientKey = "client_key"
        case transactionId = "trans_id"
    }
}
