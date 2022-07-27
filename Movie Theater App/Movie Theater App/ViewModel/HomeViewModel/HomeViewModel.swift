//
//  HomeViewModel.swift
//  Movie Theater App
//
//  Created by Brad on 7/27/22.
//

import Foundation

class HomeViewModel {
    
    let idetnifier = "cell"
    var type: CollectionType = .movie
    
    var moviesArray : [Movies] = []
    var tvArray : [TV] = []
    var popularArray : [PopularMedia] = []
    var upcomingArray : [UpcomingMedia] = []
    let storyBoardName = "Main"
    let categories = ["Trending Movies" , "Trending TV", "Popular", "Top Rated" ]

    
    enum CollectionType {
        case movie
        case TV
        case popular
        case upcoming
    }
    
}
