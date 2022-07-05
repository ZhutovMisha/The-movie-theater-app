//
//  Popular.swift
//  Movie Theater App
//
//  Created by Brad on 7/5/22.
//

import Foundation

struct PopularResponse : Codable {
    
    var results : [Popular]?
}

struct Popular : Codable {
    var id: Int?
    var original_language : String?
    var original_name : String?
    var ogiginal_title : String?
    var overview : String?
    var poster_path : String?
    var release_date : String?
    var title: String?
    var video : Bool?
    var vote_average: Int?
    var vote_count: Int?
    
    
}

/*
"adult": false,
            "backdrop_path": "/wcKFYIiVDvRURrzglV9kGu7fpfY.jpg",
            "genre_ids": [
                14,
                28,
                12
            ],
            "id": 453395,
            "original_language": "en",
            "original_title": "Doctor Strange in the Multiverse of Madness",
            "overview": "Doctor Strange, with the help of mystical allies both old and new, traverses the mind-bending and dangerous alternate realities of the Multiverse to confront a mysterious new adversary.",
            "popularity": 9411.64,
            "poster_path": "/9Gtg2DzBhmYamXBS1hKAhiwbBKS.jpg",
            "release_date": "2022-05-04",
            "title": "Doctor Strange in the Multiverse of Madness",
            "video": false,
            "vote_average": 7.5,
            "vote_count": 3956
 */
