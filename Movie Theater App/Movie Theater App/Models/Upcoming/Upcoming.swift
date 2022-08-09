//
//  Upcoming.swift
//  Movie Theater App
//
//  Created by Brad on 7/5/22.
//

import Foundation

struct UpcomingResponse : Codable {
    
    var results : [Upcoming]?
}

struct Upcoming : Codable {
    var adult : Bool?
    var id : Int?
    var original_language : String?
    var original_title : String?
    var overview : String?
    var poster_path : String?
    var release_date : String?
    var title : String?
    var vote_average : Int?
    
    
}


//"results": [
//        {
//            "adult": false,
//            "backdrop_path": "/nmGWzTLMXy9x7mKd8NKPLmHtWGa.jpg",
//            "genre_ids": [
//                10751,
//                16,
//                12,
//                35
//            ],
//            "id": 438148,
//            "original_language": "en",
//            "original_title": "Minions: The Rise of Gru",
//            "overview": "A fanboy of a supervillain supergroup known as the Vicious 6, Gru hatches a plan to become evil enough to join them, with the backup of his followers, the Minions.",
//            "popularity": 4455.931,
//            "poster_path": "/wKiOkZTN9lUUUNZLmtnwubZYONg.jpg",
//            "release_date": "2022-06-29",
//            "title": "Minions: The Rise of Gru",
//            "video": false,
//            "vote_average": 8,
//            "vote_count": 89
