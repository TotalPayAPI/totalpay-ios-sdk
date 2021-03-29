//
//  AkuratecoCreditvoidDeserializer.swift
//  AkuratecoSDK
//
//  Created by Bodia on 11.03.2021.
//

import Foundation

final class AkuratecoCreditvoidDeserializer {
    func decode(from decoder: Decoder) throws -> AkuratecoCreditvoidResult {
        return try .success(.init(from: decoder))
    }
}
