//
//  AkuratecoAdapterFactory.swift
//  AkuratecoSDK
//
//  Created by Bodia on 28.03.2021.
//

import Foundation

/// Factory class which helps to create adapters
public final class AkuratecoAdapterFactory {
    
    public init() { }
    
    /// Create and return *AkuratecoSaleAdapter*
    /// - Returns: AkuratecoSaleAdapter
    public func createSale() -> AkuratecoSaleAdapter {
        AkuratecoSaleAdapter()
    }
    
    /// Create and return *AkuratecoRecurringSaleAdapter*
    /// - Returns: AkuratecoRecurringSaleAdapter
    public func createRecurringSale() -> AkuratecoRecurringSaleAdapter {
        AkuratecoRecurringSaleAdapter()
    }
    
    /// Create and return *AkuratecoCaptureAdapter*
    /// - Returns: AkuratecoCaptureAdapter
    public func createCapture() -> AkuratecoCaptureAdapter {
        AkuratecoCaptureAdapter()
    }
    
    /// Create and return *AkuratecoCreditvoidAdapter*
    /// - Returns: AkuratecoCreditvoidAdapter
    public func createCreditvoid() -> AkuratecoCreditvoidAdapter {
        AkuratecoCreditvoidAdapter()
    }
    
    /// Create and return *AkuratecoGetTransactionStatusAdapter*
    /// - Returns: AkuratecoGetTransactionStatusAdapter
    public func createGetTransactionStatus() -> AkuratecoGetTransactionStatusAdapter {
        AkuratecoGetTransactionStatusAdapter()
    }
    
    /// Create and return *AkuratecoGetTransactionDetailsAdapter*
    /// - Returns: AkuratecoGetTransactionDetailsAdapter
    public func createGetTransactionDetails() -> AkuratecoGetTransactionDetailsAdapter {
        AkuratecoGetTransactionDetailsAdapter()
    }
}
