//
//  File.swift
//  Movie Theater App
//
//  Created by Brad on 7/27/22.
//

import Foundation

class SearchViewModel {
    
    var type: CollectionTypeMedia = .movie

    var moviesArray : [Movies] = []
    var tvArray : [TV] = []
    var popularArray : [PopularMedia] = []
    var upcomingArray : [UpcomingMedia] = []
    
     var moviesArraySearch : [Movies] = []
     var filteredMovies : [Movies] = []
    
    enum CollectionTypeMedia {
        case movie
        case TV
        case popular
        case upcoming
    }

}
