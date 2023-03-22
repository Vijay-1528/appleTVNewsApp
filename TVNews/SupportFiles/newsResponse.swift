//
//  newsResponse.swift
//  TVNews
//
//  Created by VIJAY M on 01/03/23.
//

import Foundation

// MARK: - NewsResponse
struct NewsResponse: Codable {
    let response: Response
}

// MARK: - Response
struct Response: Codable {
    let status, userTier: String
    let total, startIndex, pageSize, currentPage: Int
    let pages: Int
    let orderBy: String
    let results: [Result]
}

// MARK: - Result
struct Result: Codable {
    let id: String
    let type: TypeEnum
    let sectionID, sectionName: String
    let webPublicationDate: Date
    let webTitle: String
    let webURL, apiURL: String
    let fields: Fields
    let isHosted: Bool
    let pillarID: PillarID
    let pillarName: PillarName

    enum CodingKeys: String, CodingKey {
        case id, type
        case sectionID = "sectionId"
        case sectionName, webPublicationDate, webTitle
        case webURL = "webUrl"
        case apiURL = "apiUrl"
        case fields, isHosted
        case pillarID = "pillarId"
        case pillarName
    }
}

// MARK: - Fields
struct Fields: Codable {
    let body: String
    let thumbnail: String
}

enum PillarID: String, Codable {
    case pillarNews = "pillar/news"
    case pillarOpinion = "pillar/opinion"
    case pillarSport = "pillar/sport"
}

enum PillarName: String, Codable {
    case news = "News"
    case opinion = "Opinion"
    case sport = "Sport"
}

enum TypeEnum: String, Codable {
    case article = "article"
    case liveblog = "liveblog"
}

