//
//  AkuratecoSDK.swift
//  AkuratecoSDK
//
//  Created by Bodia on 15.02.2021.
//

import Foundation

/**
 * The initial point of the *AkuratecoSdk*.
 *
 * Before you get an account to access Payment Platform, you must provide the following data to the Payment Platform
 * administrator:
 * IP list - List of your IP addresses, from which requests to Payment Platform will be sent.
 * Notification URL - URL which will be receiving the notifications of the processing results of your request to
 * Payment Platform.
 * Contact email -  Email address of Responsible Person who will monitor transactions, conduct refunds, etc.
 *
 * Note: Notification URL is mandatory if your account supports 3D-Secure. The length of Notification URL should not be
 * more than 255 symbols.
 * With all Payment Platform POST requests at Notification URL the Merchant must return the string "OK" if he
 * successfully received data or return "ERROR".
 *
 * You should get the following information from administrator to begin working with the Payment Platform:
 * *AkuratecoCredential.clientKey* - Unique key to identify the account in Payment Platform
 * (used as request parameter).
 * *AkuratecoCredential.clientPass* - Password for Client authentication in Payment Platform
 * (used for calculating hash parameter).
 * [AkuratecoCredential.paymentUrl] - URL to request the Payment Platform.
 *
 * For the transaction, you must send the server to server HTTPS POST request with fields listed below to Payment
 * Platform URL (*AkuratecoCredential.paymentUrl*). In response Payment Platform will return the JSON  encoded string.
 * If your account supports 3D-Secure and credit card supports 3D-Secure, then Payment Platform will return the link to
 * the 3D-Secure Access Control Server to perform 3D-Secure verification. In this case, you need to redirect the
 * cardholder at this link. If there are also some parameters except the link in the result, you will need to redirect
 * the cardholder at this link together with the parameters using the method of data transmitting indicated in the same
 * result. In the case of 3D-Secure after verification on the side of the 3D-Secure server, the owner of a credit card
 * will come back to your site using the link you specify in the sale request, and Payment Platform will return the
 * result of transaction processing to the Notification URL action.
 *
 * To initialize the *AkuratecoSdk* call one of the following methods: *config*.
 * The initialization can be done programmatically.
 *
 */
public final class AkuratecoSDK {
    
    static let shared = AkuratecoSDK()
    
    var credentials: AkuratecoCredential {
        guard let credentials = _credentials else { fatalError("Akurateko SDK is not configured") }
        
        return credentials
    }
    
    private var _credentials: AkuratecoCredential?
    
    /// This fuction configure *AkuratecoSDK* with your *AkuratecoCredentials* from code
    ///
    /// - Parameter credendials: your credentilans
    /// - Requires: Use this function for configure *AkuratecoSDK* in code
    public static func config(_ credendials: AkuratecoCredential) {
        shared._credentials = credendials
    }
    
    private init() { }
}
