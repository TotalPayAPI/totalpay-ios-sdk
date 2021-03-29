//
//  AkuratecoSaleAdapter.swift
//  AkuratecoSDK
//
//  Created by Bodia on 15.02.2021.
//

import Foundation

/// The API Adapter for the SALE operation.
///
/// See *AkuratecoSaleService*
///
/// See *AkuratecoSaleCallback*
///
/// See *AkuratecoSaleResponse*
public final class AkuratecoSaleAdapter: AkuratecoBaseAdapter<AkuratecoSaleService> {
    
    private let amountFormatter = AkuratecoAmountFormatter()
    private let cardFormatter = AkuratecoCardFormatter()
    private let payerOptionsFormatter = AkuratecoPayerOptionsFormatter()
    
    /// Executes the *AkuratecoSaleService.sale* request.
    /// - Parameters:
    ///   - order: the *AkuratecoSaleOrder*.
    ///   - card: the *AkuratecoCard*.
    ///   - payer: the *AkuratecoPayer*.
    ///   - termUrl3ds: URL to which Customer should be returned after 3D-Secure. String up to 1024 characters.
    ///   - options: the *AkuratecoSaleOptions*. Optional.
    ///   - auth: indicates that transaction must be only authenticated, but not captured.
    ///   - callback: the *AkuratecoSaleCallback*.
    /// - Returns: the *URLSessionDataTask*
    @discardableResult
    public func execute(order: AkuratecoSaleOrder,
                        card: AkuratecoCard,
                        payer: AkuratecoPayer,
                        termUrl3ds: String,
                        options: AkuratecoSaleOptions? = nil,
                        auth: Bool,
                        callback: @escaping AkuratecoSaleCallback) -> URLSessionDataTask {
        let hash = AkuratecoHashUtil.hash(email: payer.email,
                                          cardNumber: card.number)!
        let payerOptions = payer.options
        
        return procesedRequest(action: .sale,
                               params: .init(channelId: options?.channelId,
                                             orderId: order.id,
                                             orderAmount: amountFormatter.amountFormat(for: order.amount) ?? "",
                                             orderCurrency: order.currency,
                                             orderDescription: order.description,
                                             cardNumber: card.number,
                                             cardExpireMonth: cardFormatter.expireMonthFormat(for: card) ?? "",
                                             cardExpireYear: cardFormatter.expireYearFormat(for: card) ?? "",
                                             cardCvv2: card.cvv,
                                             payerFirstName: payer.firstName,
                                             payerLastName: payer.lastName,
                                             payerMiddleName: payerOptions?.middleName,
                                             payerBirthDate: payerOptionsFormatter.birthdateFormat(payerOptions: payerOptions),
                                             payerAddress: payer.address,
                                             payerAddress2: payerOptions?.address2,
                                             payerCountry: payer.country,
                                             payerState: payerOptions?.state,
                                             payerCity: payer.city,
                                             payerZip: payer.zip,
                                             payerEmail: payer.email,
                                             payerPhone: payer.phone,
                                             payerIp: payer.ip,
                                             termUrl3ds: termUrl3ds,
                                             recurringInit: AkuratecoOption(options?.recurringInit ?? false),
                                             auth: AkuratecoOption(auth),
                                             hash: hash),
                               callback: callback)
    }
}
