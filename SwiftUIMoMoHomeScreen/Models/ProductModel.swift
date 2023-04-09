// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let product = try? JSONDecoder().decode(Product.self, from: jsonData)

import Foundation

// MARK: - Product
struct ProductModel: Codable {
    let status: String
    let data: [ProductItem]?
    let message: String
    let total: Int
}

// MARK: - Datum
struct ProductItem: Codable {
    let consumedMaxQuantity: ConsumedMaxQuantity?
    let isAvailable: Bool?
    let product: DatumProduct?
    let sellerInfo: SellerInfo?
    let sku: DatumSku?
//    let time: Time?
    let skuLimit: SkuLimit?
    let deal: Deal?
}

// MARK: - ConsumedMaxQuantity
struct ConsumedMaxQuantity: Codable {
    let maxQuantityCampaign, maxQuantityConsumed, maxQuantityDeal, maxQuantityPerDay: Int?
    let maxQuantityPerOrder, maxQuantitySku: Int?
    let maxQuantityType: MaxQuantityType?
    let quantityPurchasedCampaign, quantityPurchasedDeal, quantityPurchasedToday, viewedMaxQuantityPerDay: Int?
    let viewedMaxQuantityPerOrder: Int?
}

enum MaxQuantityType: String, Codable {
    case deal = "DEAL"
    case normal = "NORMAL"
    case perDay = "PER_DAY"
    case perOrder = "PER_ORDER"
}

// MARK: - Deal
struct Deal: Codable {
//    let areaCodes: [String]?
//    let autoUpdateDataSku: [JSONAny]
    let autoUpdateSku, canUse, canView: Bool?
    let chargeDealFee, code: String?
    let customerLevelCodes: [String]
    let dealID: Int?
    let dealType: MaxQuantityType
//    let endTime: Date
    let imageUrls: [JSONAny]
    let maxQuantity: Int?
    let name, owner: String?
    let price: Int?
    let pricingType: String?
    let quantity: Int?
//    let readyTime: Date
    let sellerCode: SellerCode?
    let skus: [DealSkus]?
    let slug: String?
//    let startTime: Date?
    let status: String?
}

enum SellerCode: String, Codable {
    case c6L7Styacb = "C6L7STYACB"
    case gqacbvi4Oq = "GQACBVI4OQ"
    case jrstyacbvi = "JRSTYACBVI"
    case medx = "MEDX"
    case the8Vh3I4Oqem = "8VH3I4OQEM"
    case yzzstyacbv = "YZZSTYACBV"
}

// MARK: - DealSkus
struct DealSkus: Codable {
    let quantity: Int?
    let sku: String?
}

// MARK: - DatumProduct
struct DatumProduct: Codable {
    let atc2Code: Atc2Code?
    let atc3Code: Atc3Code?
    let brand: Brand?
    let categoryCodes: [String]?
    let code: String?
    let efficacyCodes: [String]?
    let imageUrls: [String]?
    let ingredients: [Ingredient]?
    let isCombo: Bool?
    let isFragile, isFrozen: Bool?
    let isIngredientSpecial: Bool?
    let manufacturerCode, name: String?
    let note: Note?
    let origin, originName: String?
    let owner: SellerCode?
    let productID: Int?
    let registrationNumber: String?
//    let retailUnit: RetailUnit?
    let retailUnitQuantityPerUnit: Int?
    let searchKeyword: String?
    let sellerSubCategoryCode: SellerSubCategoryCode?
    let similarProductCodes: [JSONAny]?
    let slug: String?
    let subProducts: [SubProduct]?
    let unit: String?
    let usage: Usage?
    let volume: String?
    let sellerCategoryCode: String?
    let height, length, weight, width: Int?
    let dosageForm: String?
}

enum Atc2Code: String, Codable {
    case empty = ""
    case the1184Apdx4A = "1184APDX4A"
}

enum Atc3Code: String, Codable {
    case empty = ""
    case the1203G1U1Y7 = "1203G1U1Y7"
}

enum Brand: String, Codable {
    case empty = ""
    case thúySol = "Thúy Sol"
}

// MARK: - Ingredient
struct Ingredient: Codable {
    let ingredientCode, volume: String?
}

enum Note: String, Codable {
    case empty = ""
    case đâyLàGhiChú = "đây là ghi chú"
}

enum RetailUnit: String, Codable {
    case chai = "Chai"
    case empty = ""
    case gói = "Gói"
    case túi = "Túi"
}

enum SellerSubCategoryCode: String, Codable {
    case empty = ""
    case lalt0T = "LALT0T"
}

// MARK: - SubProduct
struct SubProduct: Codable {
    let code: String
    let productID, quantity: Int
}

enum Usage: String, Codable {
    case dùngTạiChỗ = "Dùng tại chỗ"
    case empty = ""
}

// MARK: - SellerInfo
struct SellerInfo: Codable {
    let avatar: [String]?
    let displayName: String?
    let isStore, isVip: Bool?
    let sellerCode: SellerCode?
    let sellerID: Int?
    let sellerName: String?
    let sellerType: SellerType?
    let slug: String?
}

enum SellerType: String, Codable {
    case enterprise = "ENTERPRISE"
    case individual = "INDIVIDUAL"
}

// MARK: - DatumSku
struct DatumSku: Codable {
    let approvedDate, code: String?
    let feeCodes: [String]?
    let hasGift: Bool?
    let hashTag: String?
    let index: Int?
    let isActive: Bool?
    let isCombo: Bool?
    let itemCode: String?
    let locationCodes: [String]?
    let lotDates: [LotDate]?
    let maxQuantityPerOrder: Int?
    let noneVat: Bool?
    let priority: Double?
    let productCode: String?
    let productID: Int?
    let purchasePrice: Int?
    let retailPriceType: RetailPriceType
    let retailPriceValue: Int?
    let sellerClass: SellerClass?
    let sellerCode: SellerCode?
    let sku: String?
    let skus: [SkuSkus]?
    let slug: String?
    let status: Status?
    let statusPriority: Int?
    let tags: [String]?
    let type: MaxQuantityType?
    let version: String?
    let requiredCertificates: [JSONAny]?
    let sellerID, vat: Int?
//    let statusData: StatusData?
    let timeChangeStatus: String?
    let point, pointMultiplier: Int?
    let dealCode: String?
    let fromTrading: Bool?
    let fulfill: Int?
    let level: String?
    let levelSpecial: LevelSpecial?
    let rawPrice, sellerInventory: Int?
    let sellerPrivateSKU: String?
    let isAutoUpdatePrice: Bool?
    let dynamicPricingLevel: Int?
    let comboDiscountType: String?
    let comboDiscountValue, comboMaxDiscountValue: Int?
    let useSKUsPrice: Bool?
}

// MARK: - LevelSpecial
struct LevelSpecial: Codable {
    let level: String
    let timeApplyLevel: Int
    let timeEndApplyLevel, timeStartApplyLevel: String
}

// MARK: - LotDate
struct LotDate: Codable {
    let expiredDate: String?
    let isNearExpired: Bool
}

enum RetailPriceType: String, Codable {
    case fixedPrice = "FIXED_PRICE"
    case fixedRevenue = "FIXED_REVENUE"
}

enum SellerClass: String, Codable {
    case external = "EXTERNAL"
    case sellerClassINTERNAL = "INTERNAL"
}

// MARK: - SkuSkus
struct SkuSkus: Codable {
    let itemCode, productCode: String
    let productData: ProductData
    let productID, quantity: Int
    let sku: String
    let requiredCertificates: [JSONAny]?
}

// MARK: - ProductData
struct ProductData: Codable {
    let isAvailable: Bool
    let product: ProductDataProduct
    let sku: ProductDataSku?
}

// MARK: - ProductDataProduct
struct ProductDataProduct: Codable {
    let imageUrls: [String]
    let name: String
}

// MARK: - ProductDataSku
struct ProductDataSku: Codable {
    let hasGift: Bool
    let retailPriceValue: Int
    let slug: String
    let status, type: MaxQuantityType
}

enum Status: String, Codable {
    case limit = "LIMIT"
    case normal = "NORMAL"
}

// MARK: - StatusData
struct StatusData: Codable {
//    let date: Date?
    let note: String?
    let nextStatus: String?
    let quantity: Int?
    let isAutoCheckStock: Bool?
    let minQuantityAutoLimit: Int?
    let nextIsActive: Bool?
}

// MARK: - SkuLimit
struct SkuLimit: Codable {
    let code: String?
    let isActive: Bool?
    let itemCode: String?
    let numberOfDays, quantity: Int?
    let sku: String?
    let skuLimitID: Int?

    enum CodingKeys: String, CodingKey {
        case code, isActive, itemCode, numberOfDays, quantity, sku
        case skuLimitID = "skuLimitId"
    }
}

enum Time: String, Codable {
    case the20230326T124254772284038Z = "2023-03-26T12:42:54.772284038Z"
}

// MARK: - Encode/decode helpers

//class JSONNull: Codable, Hashable {
//
//    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
//        return true
//    }
//
//    public var hashValue: Int {
//        return 0
//    }
//
//    public init() {}
//
//    public required init(from decoder: Decoder) throws {
//        let container = try decoder.singleValueContainer()
//        if !container.decodeNil() {
//            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
//        }
//    }
//
//    public func encode(to encoder: Encoder) throws {
//        var container = encoder.singleValueContainer()
//        try container.encodeNil()
//    }
//}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}
