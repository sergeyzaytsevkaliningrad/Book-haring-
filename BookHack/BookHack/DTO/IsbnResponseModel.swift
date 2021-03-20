//
//  IsbnResponseModel.swift
//  BookHack
//
//  Created by Yoav Nemirovsky on 20.03.2021.
//

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let isbnResponseModel = try? newJSONDecoder().decode(IsbnResponseModel.self, from: jsonData)

import Foundation

// MARK: - IsbnResponseModel
struct IsbnResponseModel: Codable {
    let kind: String?
    let totalItems: Int?
    let items: [Item]?
}

// MARK: - Item
struct Item: Codable {
    let kind, id, etag: String?
    let selfLink: String?
    let volumeInfo: VolumeInfo?
    let saleInfo: SaleInfo?
    let accessInfo: AccessInfo?
    let searchInfo: SearchInfo?
}

// MARK: - AccessInfo
struct AccessInfo: Codable {
    let country, viewability: String?
    let embeddable, publicDomain: Bool?
    let textToSpeechPermission: String?
    let epub, pdf: Epub?
    let webReaderLink: String?
    let accessViewStatus: String?
    let quoteSharingAllowed: Bool?
}

// MARK: - Epub
struct Epub: Codable {
    let isAvailable: Bool?
}

// MARK: - SaleInfo
struct SaleInfo: Codable {
    let country, saleability: String?
    let isEbook: Bool?
    let listPrice, retailPrice: SaleInfoListPrice?
    let buyLink: String?
    let offers: [Offer]?
}

// MARK: - SaleInfoListPrice
struct SaleInfoListPrice: Codable {
    let amount: Double?
    let currencyCode: String?
}

// MARK: - Offer
struct Offer: Codable {
    let finskyOfferType: Int?
    let listPrice, retailPrice: OfferListPrice?
}

// MARK: - OfferListPrice
struct OfferListPrice: Codable {
    let amountInMicros: Int?
    let currencyCode: String?
}

// MARK: - SearchInfo
struct SearchInfo: Codable {
    let textSnippet: String?
}

// MARK: - VolumeInfo
struct VolumeInfo: Codable {
    let title, subtitle: String?
    let authors: [String]?
    let publisher, volumeInfoDescription: String?
    let industryIdentifiers: [IndustryIdentifier]?
    let readingModes: ReadingModes?
    let pageCount: Int?
    let printType, maturityRating: String?
    let allowAnonLogging: Bool?
    let contentVersion: String?
    let panelizationSummary: PanelizationSummary?
    let imageLinks: ImageLinks?
    let language: String?
    let previewLink: String?
    let infoLink, canonicalVolumeLink: String?

    enum CodingKeys: String, CodingKey {
        case title, subtitle, authors, publisher
        case volumeInfoDescription = "description"
        case industryIdentifiers, readingModes, pageCount, printType, maturityRating, allowAnonLogging, contentVersion, panelizationSummary, imageLinks, language, previewLink, infoLink, canonicalVolumeLink
    }
}

// MARK: - ImageLinks
struct ImageLinks: Codable {
    let smallThumbnail, thumbnail: String?
}

// MARK: - IndustryIdentifier
struct IndustryIdentifier: Codable {
    let type, identifier: String?
}

// MARK: - PanelizationSummary
struct PanelizationSummary: Codable {
    let containsEpubBubbles, containsImageBubbles: Bool?
}

// MARK: - ReadingModes
struct ReadingModes: Codable {
    let text, image: Bool?
}
