//
//  OrderAkuratecoResult.swift
//  AkuratecoSDK
//
//  Created by Bodia on 08.03.2021.
//

import Foundation

/// The base response order result data holder description.
///
/// See *AkuratecoResponse, AkuratecoResultProtocol*
public protocol OrderAkuratecoResultProtocol: AkuratecoResultProtocol {
    
    /// Amount of capture.
    var orderAmount: Double { get }
    
    /// Currency.
    var orderCurrency: String { get }
}
