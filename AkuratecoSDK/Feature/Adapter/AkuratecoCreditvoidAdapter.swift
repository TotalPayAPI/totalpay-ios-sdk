//
//  AkuratecoCreditvoidAdapter.swift
//  AkuratecoSDK
//
//  Created by Bodia on 15.02.2021.
//

import Foundation

/// The API Adapter for the CREDITVOID operation.
///
/// See *AkuratecoCreditvoidService*
///
/// See *AkuratecoCreditvoidCallback*
public final class AkuratecoCreditvoidAdapter: AkuratecoBaseAdapter<AkuratecoCreditvoidService> {
    
    private let akuratecoAmountFormatter = AkuratecoAmountFormatter()
    
    /// Executes the *AkuratecoCreditvoidService.creditvoid* request.
    /// - Parameters:
    ///   - transactionId: transaction ID in the Payment Platform. UUID format value.
    ///   - payerEmail: customer’s email. String up to 256 characters.
    ///   - cardNumber: the credit card number.
    ///   - amount: the amount for capture. Only one partial capture is allowed. Numbers in the form XXXX.XX (without leading zeros).
    ///   - callback: the *AkuratecoCreditvoidCallback*.
    /// - Returns: the *URLSessionDataTask*
    @discardableResult
    public func execute(transactionId: String,
                 payerEmail: String,
                 cardNumber: String,
                 amount: Double?,
                 callback: @escaping AkuratecoCreditvoidCallback) -> URLSessionDataTask {
        let hash = AkuratecoHashUtil.hash(email: payerEmail,
                                          cardNumber: cardNumber,
                                          transactionId: transactionId)!
        
        return execute(transactionId: transactionId,
                       hash: hash,
                       amount: amount,
                       callback: callback)
    }
    
    /// Executes the *AkuratecoCreditvoidService.creditvoid* request.
    /// - Parameters:
    ///   - transactionId: transaction ID in the Payment Platform. UUID format value.
    ///   - hash: special signature to validate your request to payment platform.
    ///   - amount: the amount for capture. Only one partial capture is allowed. Numbers in the form XXXX.XX (without leading zeros).
    ///   - callback: the *AkuratecoCreditvoidCallback*.
    /// - Returns: the *URLSessionDataTask*
    @discardableResult
    public func execute(transactionId: String,
                        hash: String,
                        amount: Double?,
                        callback: @escaping AkuratecoCreditvoidCallback) -> URLSessionDataTask {
        procesedRequest(action: .capture,
                        params: .init(transactionId: transactionId,
                                      amount: akuratecoAmountFormatter.amountFormat(for: amount),
                                      hash: hash),
                        callback: callback)
    }
}
