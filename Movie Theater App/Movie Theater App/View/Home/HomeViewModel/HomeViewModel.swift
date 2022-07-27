//
//  HomeViewModel.swift
//  Movie Theater App
//
//  Created by Brad on 7/27/22.
//

import Foundation

class HomeViewModel {
    var type: CollectionType = .movie
    
    var moviesArray : [Movies] = []
    var tvArray : [TV] = []
    var popularArray : [PopularMedia] = []
    var upcomingArray : [UpcomingMedia] = []
    
    enum CollectionType {
        case movie
        case TV
        case popular
        case upcoming
    }
}
