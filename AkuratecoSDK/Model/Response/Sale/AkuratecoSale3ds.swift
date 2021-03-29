//
//  AkuratecoSale3ds.swift
//  AkuratecoSDK
//
//  Created by Bodia on 09.03.2021.
//

import Foundation

/// The SALE 3DS result of the *AkuratecoSaleResult*.
///
/// See *AkuratecoSaleResponse*
public struct AkuratecoSale3ds: DetailsAkuratecoResultProtocol {
    
    public let action: AkuratecoAction
    
    public let result: AkuratecoResult
    
    public let status: AkuratecoStatus
    
    public let orderId: String
    
    public let transactionId: String
    
    public let transactionDate: Date
    
    public let descriptor: String?
    
    public let orderAmount: Double
    
    public let orderCurrency: String
    
    /// URL to which the Merchant should redirect the Customer.
    public let redirectUrl: String
    
    /// The *AkuratecoSaleRedirectParams*.
    public let redirectParams: AkuratecoSaleRedirectParams
    
    /// The method of transferring parameters (POST/GET).
    public let redirectMethod: AkuratecoRedirectMethod
}

extension AkuratecoSale3ds: Decodable {
    enum CodingKeys: String, CodingKey {
        case action, result, status, descriptor
        case orderId = "order_id"
        case transactionId = "trans_id"
        case transactionDate = "trans_date"
        case orderAmount = "amount"
        case orderCurrency = "currency"
        case redirectUrl = "redirect_url"
        case redirectParams = "redirect_params"
        case redirectMethod = "redirect_method"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        action = try container.decode(AkuratecoAction.self, forKey: .action)
        result = try container.decode(AkuratecoResult.self, forKey: .result)
        status = try container.decode(AkuratecoStatus.self, forKey: .status)
        orderId = try container.decode(String.self, forKey: .orderId)
        transactionId = try container.decode(String.self, forKey: .transactionId)
        orderCurrency = try container.decode(String.self, forKey: .orderCurrency)
        redirectUrl = try container.decode(String.self, forKey: .redirectUrl)
        redirectParams = try container.decode(AkuratecoSaleRedirectParams.self, forKey: .redirectParams)
        redirectMethod = try container.decode(AkuratecoRedirectMethod.self, forKey: .redirectMethod)
        
        orderAmount = Double(try container.decode(String.self, forKey: .orderAmount)) ?? 0
        transactionDate = AkuratecoDateFormatter.date(from: try container.decode(String.self, forKey: .transactionDate)) ?? Date()

        descriptor = try container.decodeIfPresent(String.self, forKey: .descriptor)
    }
}
