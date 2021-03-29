//
//  AkuratecoError.swift
//  AkuratecoSDK
//
//  Created by Bodia on 15.02.2021.
//

import Foundation

/// The error response data holder.
///
/// Presented as the param in *AkuratecoResponse.error*.
///
/// See *AkuratecoResponse, AkuratecoBaseAdapter, AkuratecoExactError*
public struct AkuratecoError: Error {
    
    /// Always *AkuratecoResult.error*.
    public let result: AkuratecoResult
    
    /// Error code.
    public let code: Int
    
    /// Error message.
    public let message: String
    
    /// :ist of the *AkuratecoExactError*.
    public let exactErrors: [AkuratecoExactError]
    
    /// Default *Error* description property
    public var localizedDescription: String { message }
}

extension AkuratecoError: Decodable {
    enum CodingKeys: String, CodingKey {
        case result
        case code = "error_code"
        case message = "error_message"
        case exactErrors = "errors"
    }
}
