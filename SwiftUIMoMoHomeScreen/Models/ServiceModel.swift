//
//  ServiceModel.swift
//  SwiftUIMoMoHomeScreen
//
//  Created by Thuocsi on 22/03/2023.
//

import Foundation

// MARK: - ServiceModel
struct ServiceModel: Codable {
    let status: String?
    let data: [Datum]
    let message: String?
}

// MARK: - Datum
struct Datum: Codable, Identifiable {
    var id: String? = UUID().uuidString
    let appCode, appValueCode, createdTime: String?
    let lastUpdatedTime: String?
    let value: Value?
}

// MARK: - Value
struct Value: Codable {
    let defaultParam, description, extra, icon: String?
    let key, language, name, port: String?
    let query, refID: String?
    let sortOrder: Int?
    let special: String?
    let status: Int?
    let uri, user: String?

    enum CodingKeys: String, CodingKey {
        case defaultParam, description, extra, icon, key, language, name, port, query
        case refID = "refId"
        case sortOrder, special, status, uri, user
    }
}


