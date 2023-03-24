//
//  BannerModel.swift
//  SwiftUIMoMoHomeScreen
//
//  Created by Thuocsi on 24/03/2023.
//

import Foundation

// MARK: - BannerModel
struct BannerModel: Codable {
    let status: String
    let data: [DataBannerItem]
    let message: String
    let isBasic: Bool
    let timeExcute, timeFetchAPI: Int
}

// MARK: - Datum
struct DataBannerItem: Codable {
    let id: JSONNull?
    let code: String
    let createdTime: JSONNull?
    let description: String
    let imgURL: String
    let isVisible: Bool
    let lastUpdatedTime: JSONNull?
    let name: String
    let targetURL: String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case code, createdTime, description, imgURL, isVisible, lastUpdatedTime, name, targetURL
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
