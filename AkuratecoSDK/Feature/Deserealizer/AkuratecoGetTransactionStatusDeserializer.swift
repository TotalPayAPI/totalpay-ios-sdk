//
//  AkuratecoGetTransactionStatusDeserializer.swift
//  AkuratecoSDK
//
//  Created by Bodia on 11.03.2021.
//

import Foundation

final class AkuratecoGetTransactionStatusDeserializer {
    func decode(from decoder: Decoder) throws -> AkuratecoGetTransactionStatusResult {
        return try .success(.init(from: decoder))
    }
}
