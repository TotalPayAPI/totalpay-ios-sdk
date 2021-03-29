//
//  AkuratecoGetTransactionDetailsDeserializer.swift
//  AkuratecoSDK
//
//  Created by Bodia on 11.03.2021.
//

import Foundation

final class AkuratecoGetTransactionDetailsDeserializer {
    func decode(from decoder: Decoder) throws -> AkuratecoGetTransactionDetailsResult {
        return try .success(.init(from: decoder))
    }
}
