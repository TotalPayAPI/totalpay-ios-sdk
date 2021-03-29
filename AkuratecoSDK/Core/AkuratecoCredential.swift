//
//  AkuratecoCredential.swift
//  AkuratecoSDK
//
//  Created by Bodia on 15.02.2021.
//

import Foundation

/// Class which holds all Akurateco credentials which was passed from *AkuratecoSdk.config(...)* methods
public struct AkuratecoCredential {
    
    /// Unique key to identify the account in Payment Akurateco (used as request parameter)
    public let clientKey: String
    
    /// Password for Client authentication in Payment Akurateco (used for calculating hash parameter)
    public let clientPass: String
    
    /// URL to request the Payment Akurateco
    public let paymentUrl: String
    
    /// Provide Akurateco SDK credentials and store them here
    /// - Parameters:
    ///   - clientKey: Unique key to identify the account in Payment Akurateco (used as request parameter)
    ///   - clientPass: Password for Client authentication in Payment Akurateco (used for calculating hash parameter)
    ///   - paymentUrl: URL to request the Payment Akurateco
    public init(clientKey: String, clientPass: String, paymentUrl: String) {
        self.clientKey = clientKey
        self.clientPass = clientPass
        self.paymentUrl = paymentUrl
    }
}
