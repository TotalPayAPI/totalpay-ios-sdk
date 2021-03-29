//
//  AkuratecoCallback.swift
//  AkuratecoSDK
//
//  Created by Bodia on 15.02.2021.
//

import Foundation

/// AkuratecoCallback
/// - Result: the successful result type of the *Response*
public typealias AkuratecoCallback<Result: Decodable> = (AkuratecoResponse<Result>) -> Void

/// AkuratecoResponse
/// - Result: the successful result type of the *Response*
public enum AkuratecoResponse<Result: Decodable> {
    
    /// The custom suucess result case
    case result(Result)
    
    /// The custom error result case
    case error(AkuratecoError)
    
    /// The unhandled exception case
    case failure(Error)
}
