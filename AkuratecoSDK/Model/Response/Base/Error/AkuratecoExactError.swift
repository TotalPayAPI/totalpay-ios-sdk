//
//  AkuratecoExactError.swift
//  AkuratecoSDK
//
//  Created by Bodia on 08.03.2021.
//

import Foundation

/// The exact error data holder.
///
/// See *AkuratecoResponse, AkuratecoBaseAdapter, AkuratecoError*
public struct AkuratecoExactError: Error {
    
    /// Code error code.
    public let code: Int
    
    /// Error message.
    public let message: String
}

extension AkuratecoExactError: Decodable {
    enum CodingKeys: String, CodingKey {
        case code = "error_code"
        case message = "error_message"
    }
}
