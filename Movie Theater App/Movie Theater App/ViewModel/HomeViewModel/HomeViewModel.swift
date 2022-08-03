//
//  HomeViewModel.swift
//  Movie Theater App
//
//  Created by Brad on 7/27/22.
//

import Foundation



    // Model
public class HomeViewModel {
    
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
    
    func downloadMovies(completion: @escaping(()-> ())) {
        APImanager.shared.downloadTrendingMovies { movies in
            self.moviesArray = movies
            completion()
        }
        
    }
    
    func downloadTV (completion: @escaping(()-> ())) {
        APImanager.shared.downloadTV { tv in
            self.tvArray = tv
            completion()
            
        }
    }
    
        func downloadPopular(completion: @escaping(()-> ())) {
        APImanager.shared.downloadPopularMovies { popular in
            self.popularArray = popular
            completion()
        }
    }
    
    func downloadUpcoming(completion: @escaping(()-> ())) {
        APImanager.shared.downloadUpcoming { upcoming in
            self.upcomingArray = upcoming
            completion()
        }
    }
}
