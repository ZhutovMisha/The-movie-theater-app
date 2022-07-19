import Foundation
public struct Movies : Codable {
    let backdrop_path : String?
    let genre_ids : [Int]?
    let original_language : String?
    let original_title : String?
    let poster_path : String?
    let video : Bool?
    let vote_average : Double?
    let vote_count : Int?
    let overview : String?
    let release_date : String?
    let title : String?
    let id : Int?
    let adult : Bool?
    let popularity : Double?
    let media_type : String?

    enum CodingKeys: String, CodingKey {

        case backdrop_path = "backdrop_path"
        case genre_ids = "genre_ids"
        case original_language = "original_language"
        case original_title = "original_title"
        case poster_path = "poster_path"
        case video = "video"
        case vote_average = "vote_average"
        case vote_count = "vote_count"
        case overview = "overview"
        case release_date = "release_date"
        case title = "title"
        case id = "id"
        case adult = "adult"
        case popularity = "popularity"
        case media_type = "media_type"
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        backdrop_path = try values.decodeIfPresent(String.self, forKey: .backdrop_path)
        genre_ids = try values.decodeIfPresent([Int].self, forKey: .genre_ids)
        original_language = try values.decodeIfPresent(String.self, forKey: .original_language)
        original_title = try values.decodeIfPresent(String.self, forKey: .original_title)
        poster_path = try values.decodeIfPresent(String.self, forKey: .poster_path)
        video = try values.decodeIfPresent(Bool.self, forKey: .video)
        vote_average = try values.decodeIfPresent(Double.self, forKey: .vote_average)
        vote_count = try values.decodeIfPresent(Int.self, forKey: .vote_count)
        overview = try values.decodeIfPresent(String.self, forKey: .overview)
        release_date = try values.decodeIfPresent(String.self, forKey: .release_date)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        adult = try values.decodeIfPresent(Bool.self, forKey: .adult)
        popularity = try values.decodeIfPresent(Double.self, forKey: .popularity)
        media_type = try values.decodeIfPresent(String.self, forKey: .media_type)
    }

}
