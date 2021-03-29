//
//  AkuratecoGetTransactionDetailsAdapter.swift
//  AkuratecoSDK
//
//  Created by Bodia on 15.02.2021.
//

import Foundation

/// The API Adapter for the GET_TRANS_DETAILS operation.
///
/// See *AkuratecoGetTransactionDetailsService*
///
/// See *AkuratecoGetTransactionDetailsCallback*
public final class AkuratecoGetTransactionDetailsAdapter: AkuratecoBaseAdapter<AkuratecoGetTransactionDetailsService> {
    
    /// Executes the *fAkuratecoGetTransactionDetailsService.getTransactionDetails* request.
    /// - Parameters:
    ///   - transactionId: transaction ID in the Payment Platform. UUID format value.
    ///   - payerEmail: customer’s email. String up to 256 characters.
    ///   - cardNumber: the credit card number.
    ///   - callback: the *AkuratecoGetTransactionDetailsCallback*.
    /// - Returns: the *URLSessionDataTask*
    @discardableResult
    public func execute(transactionId: String,
                        payerEmail: String,
                        cardNumber: String,
                        callback: @escaping AkuratecoGetTransactionDetailsCallback) -> URLSessionDataTask {
        let hash = AkuratecoHashUtil.hash(email: payerEmail,
                                          cardNumber: cardNumber,
                                          transactionId: transactionId)!
        
        return execute(transactionId: transactionId,
                       hash: hash,
                       callback: callback)
    }
    
    /// Executes the *AkuratecoGetTransactionDetailsService.getTransactionDetails* request.
    /// - Parameters:
    ///   - transactionId: transaction ID in the Payment Platform. UUID format value.
    ///   - hash: special signature to validate your request to payment platform.
    ///   - callback: the *AkuratecoGetTransactionDetailsCallback*.
    /// - Returns: the *URLSessionDataTask*
    @discardableResult
    public func execute(transactionId: String,
                        hash: String,
                        callback: @escaping AkuratecoGetTransactionDetailsCallback) -> URLSessionDataTask {
        procesedRequest(action: .getTransDetails,
                        params: .init(transactionId: transactionId,
                                      hash: hash),
                        callback: callback)
    }
}


