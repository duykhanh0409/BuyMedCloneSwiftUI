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
    let data: [Feature]
    let message: String?
}

// MARK: - Datum
struct Feature: Codable {
//    static func == (lhs: Datum, rhs: Datum) -> Bool {
//        return lhs.appCode == rhs.appCode && lhs.appValueCode == rhs.appValueCode && lhs.createdTime == rhs.createdTime && lhs.lastUpdatedTime == rhs.lastUpdatedTime && lhs.value == rhs.value && lhs.id == rhs.id
//    }
//    var uid: String? = UUID().uuidString
//    var id: String? = UUID().uuidString
    let appCode, appValueCode, createdTime: String?
    let lastUpdatedTime: String?
    let value: Value?
}

//extension Datum: Hashable {
//        static func == (lhs: Self, rhs: Self) -> Bool {
//            lhs.id == rhs.id
//        }
//        func hash(into hasher: inout Hasher) {
//            hasher.combine(id)
//        }
//    }

// MARK: - Value
struct Value: Codable, Equatable {
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


