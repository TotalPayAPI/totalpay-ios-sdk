//
//  AkuratecoCaptureDeserializer.swift
//  AkuratecoSDK
//
//  Created by Bodia on 11.03.2021.
//

import Foundation

final class AkuratecoCaptureDeserializer {
    enum CodingKeys: String, CodingKey {
        case result
    }

    func decode(from decoder: Decoder) throws -> AkuratecoCaptureResult {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        let result = try container.decode(AkuratecoResult.self, forKey: .result)
        
        switch result {
        case .declined: return .decline(try .init(from: decoder))
        default: return .success(try .init(from: decoder))
        }
    }
}
