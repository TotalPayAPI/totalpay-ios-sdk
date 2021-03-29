//
//  AkuratecoPayer.swift
//  AkuratecoSDK
//
//  Created by Bodia on 15.02.2021.
//

import Foundation

/// The required payer data holder.
///
/// See *AkuratecoSaleAdapter, AkuratecoPayerOptions*
public final class AkuratecoPayer {
    
    /// Customer’s name. String up to 32 characters.
    public var firstName: String
    
    /// Customer’s surname. String up to 32 characters.
    public var lastName: String
    
    /// Customer’s address. String up to 255 characters.
    public var address: String
    
    /// Customer’s country. 2-letter code.
    public var country: String
    
    /// Customer’s city. String up to 32 characters.
    public var city: String
    
    /// ZIP-code of the Customer. String up to 32 characters.
    public var zip: String
    
    /// Customer’s email. String up to 256 characters.
    public var email: String
    
    /// Chone customer’s phone. String up to 32 characters.
    public var phone: String
    
    /// IP-address of the Customer. XXX.XXX.XXX.XXX.
    public var ip: String
    
    /// The optional *AkuratecoPayerOptions*.
    public var options: AkuratecoPayerOptions?
    
    /// Create the required payer data holder.
    /// - Parameters:
    ///   - firstName: Customer’s name. String up to 32 characters.
    ///   - lastName: Customer’s surname. String up to 32 characters.
    ///   - address: Customer’s address. String up to 255 characters.
    ///   - country: Customer’s country. 2-letter code.
    ///   - city: Customer’s city. String up to 32 characters.
    ///   - zip: ZIP-code of the Customer. String up to 32 characters.
    ///   - email: Customer’s email. String up to 256 characters.
    ///   - phone: Chone customer’s phone. String up to 32 characters.
    ///   - ip: IP-address of the Customer. XXX.XXX.XXX.XXX.
    ///   - options: The optional *AkuratecoPayerOptions*.
    public init(firstName: String, lastName: String, address: String, country: String, city: String, zip: String, email: String, phone: String, ip: String, options: AkuratecoPayerOptions? = nil) {
        self.firstName = firstName
        self.lastName = lastName
        self.address = address
        self.country = country
        self.city = city
        self.zip = zip
        self.email = email
        self.phone = phone
        self.ip = ip
        self.options = options
    }
}
