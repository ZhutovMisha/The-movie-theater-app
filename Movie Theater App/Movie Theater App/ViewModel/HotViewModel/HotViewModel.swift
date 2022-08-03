//
//  File.swift
//  Movie Theater App
//
//  Created by Brad on 7/27/22.
//

import Foundation

class HotViewModel {
    public var moviesArray : [Movies] = []
    public var tvArray : [TV] = []
   
    
    func downloadMovies(completion: @escaping (()-> ())) {
        APImanager.shared.downloadTrendingMovies { movies in
            self.moviesArray = movies
            completion()
        }
        
    }
    
    func downloadTV (completion: @escaping (()-> ())) {
        APImanager.shared.downloadTV { tv in
            self.tvArray = tv
            completion()
            
        }
    }
}
