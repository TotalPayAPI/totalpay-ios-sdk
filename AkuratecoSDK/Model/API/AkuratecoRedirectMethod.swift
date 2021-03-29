//
//  AkuratecoRedirectMethod.swift
//  AkuratecoSDK
//
//  Created by Bodia on 15.02.2021.
//

import Foundation

/// The method of transferring parameters (POST/GET).
/// 
/// See *AkuratecoSale3ds*
public enum AkuratecoRedirectMethod: String, Decodable {
    
    /// GET redirect method value.
    case get = "GET"
    
    /// POST redirect method value.
    case post = "POST"
}
