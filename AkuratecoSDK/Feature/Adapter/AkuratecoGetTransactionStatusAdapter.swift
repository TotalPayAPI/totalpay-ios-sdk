//
//  AkuratecoGetTransactionStatusAdapter.swift
//  AkuratecoSDK
//
//  Created by Bodia on 15.02.2021.
//

import Foundation

/// The API Adapter for the GET_TRANS_STATUS operation.
///
/// See *AkuratecoGetTransactionStatusService*
///
/// See *AkuratecoGetTransactionStatusCallback*
public final class AkuratecoGetTransactionStatusAdapter: AkuratecoBaseAdapter<AkuratecoGetTransactionStatusService> {
    
    /// Executes the *AkuratecoGetTransactionStatusService.getTransactionStatus* request.
    /// - Parameters:
    ///   - transactionId: transaction ID in the Payment Platform. UUID format value.
    ///   - payerEmail: customer’s email. String up to 256 characters.
    ///   - cardNumber: the credit card number.
    ///   - callback: the *AkuratecoGetTransactionStatusCallback*.
    /// - Returns: the *URLSessionDataTask*
    @discardableResult
    public func execute(transactionId: String,
                        payerEmail: String,
                        cardNumber: String,
                        callback: @escaping AkuratecoGetTransactionStatusCallback) -> URLSessionDataTask {
        let hash = AkuratecoHashUtil.hash(email: payerEmail,
                                          cardNumber: cardNumber,
                                          transactionId: transactionId)!
        
        return execute(transactionId: transactionId,
                       hash: hash,
                       callback: callback)
    }
    
    /// Executes the *AkuratecoGetTransactionStatusService.getTransactionStatus* request.
    /// - Parameters:
    ///   - transactionId: transaction ID in the Payment Platform. UUID format value.
    ///   - hash: special signature to validate your request to payment platform.
    ///   - callback: the *AkuratecoGetTransactionStatusCallback*.
    /// - Returns: the *URLSessionDataTask*
    @discardableResult
    public func execute(transactionId: String,
                        hash: String,
                        callback: @escaping AkuratecoGetTransactionStatusCallback) -> URLSessionDataTask {
        procesedRequest(action: .getTransStatus,
                        params: .init(transactionId: transactionId,
                                      hash: hash),
                        callback: callback)
    }
}
