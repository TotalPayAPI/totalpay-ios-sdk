//
//  AkuratecoRecurringSaleAdapter.swift
//  AkuratecoSDK
//
//  Created by Bodia on 15.02.2021.
//

import Foundation

/// The API Adapter for the RECURRING_SALE operation.
///
/// See *AkuratecoRecurringSaleService*
///
/// See *AkuratecoSaleCallback*
public final class AkuratecoRecurringSaleAdapter: AkuratecoBaseAdapter<AkuratecoRecurringSaleService> {
    
    private let amountFormatter = AkuratecoAmountFormatter()
    
    /// Executes the *AkuratecoRecurringSaleService.recurringSale* request.
    /// - Parameters:
    ///   - order: the *AkuratecoOrder*.
    ///   - options: the *AkuratecoRecurringOptions*.
    ///   - payerEmail: customer’s email. String up to 256 characters.
    ///   - cardNumber: the credit card number.
    ///   - auth: indicates that transaction must be only authenticated, but not captured.
    ///   - callback: the *AkuratecoSaleCallback*.
    /// - Returns: the *URLSessionDataTask*
    @discardableResult
    public func execute(order: AkuratecoOrderProtocol,
                        options: AkuratecoRecurringOptions,
                        payerEmail: String,
                        cardNumber: String,
                        auth: Bool,
                        callback: @escaping AkuratecoSaleCallback) -> URLSessionDataTask {
        let hash = AkuratecoHashUtil.hash(email: payerEmail,
                                          cardNumber: cardNumber)!
        
        return execute(order: order,
                       options: options,
                       hash: hash,
                       auth: auth,
                       callback: callback)
    }
    
    /// Executes the *AkuratecoRecurringSaleService.recurringSale* request.
    /// - Parameters:
    ///   - order: the *AkuratecoOrder*.
    ///   - options: the *AkuratecoRecurringOptions*.
    ///   - hash: special signature to validate your request to payment platform.
    ///   - auth: indicates that transaction must be only authenticated, but not captured.
    ///   - callback: the *AkuratecoSaleCallback*.
    /// - Returns: the *URLSessionDataTask*
    @discardableResult
    public func execute(order: AkuratecoOrderProtocol,
                        options: AkuratecoRecurringOptions,
                        hash: String,
                        auth: Bool,
                        callback: @escaping AkuratecoSaleCallback) -> URLSessionDataTask {
        procesedRequest(action: .recurringSale,
                        params: .init(orderId: order.id,
                                      orderAmount: amountFormatter.amountFormat(for: order.amount) ?? "",
                                      orderDescription: order.description,
                                      recurringFirstTransactionId: options.firstTransactionId,
                                      recurringToken: options.token,
                                      auth: .init(auth),
                                      hash: hash),
                        callback: callback)
    }
}

