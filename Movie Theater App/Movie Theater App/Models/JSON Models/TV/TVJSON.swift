// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let tvjson = try? newJSONDecoder().decode(Tvjson.self, from: jsonData)

import Foundation

// MARK: - Tvjson
struct Tvjson: Codable {
    let page: Int
    let results: [Result]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Result
struct Result: Codable {
    let adult: Bool
    let backdropPath: String
    let genreIDS: [Int]
    let id: Int
    let mediaType: MediaType
    let name: String
    let originCountry: [String]
    let originalLanguage: OriginalLanguage
    let originalName, overview: String
    let popularity: Double
    let posterPath, firstAirDate: String
    let voteAverage: Double
    let voteCount: Int

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case mediaType = "media_type"
        case name
        case originCountry = "origin_country"
        case originalLanguage = "original_language"
        case originalName = "original_name"
        case overview, popularity
        case posterPath = "poster_path"
        case firstAirDate = "first_air_date"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

enum MediaType: String, Codable {
    case tv = "tv"
}

enum OriginalLanguage: String, Codable {
    case en = "en"
    case es = "es"
    case ja = "ja"
    case ko = "ko"
}
