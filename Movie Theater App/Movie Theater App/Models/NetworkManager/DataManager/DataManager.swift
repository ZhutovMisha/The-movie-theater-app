//
//  File.swift
//  Movie Theater App
//
//  Created by Brad on 7/5/22.
//

import Foundation
import RealmSwift

struct DataManager {
    
   private   let realm = try? Realm()
    
    //MARK: -Realm
    
    func save(_ movie  : Movies?) {
        
        guard let movie = movie else {return}

        let movieRealm = MovieRealm()
 
        movieRealm.name = movie.title ?? "Unkown"
        movieRealm.overview = movie.overview ?? "Unkown"
        movieRealm.date = movie.release_date ??  "Unkown"
        movieRealm.posterPath = movie.poster_path ?? "Unkown"
        
        
        try?realm?.write{
            realm?.add(movieRealm)
        }
        
    }
    
    func getMovies() -> [MovieRealm] {
        var movies : [MovieRealm] = []
        guard let moviesResult = realm?.objects(MovieRealm.self) else { return [] }
        for movie in moviesResult {
            movies.append(movie)
        }
        return movies
        
    }
}


