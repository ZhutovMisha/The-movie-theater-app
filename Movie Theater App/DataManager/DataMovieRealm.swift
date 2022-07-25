//
//  DataMovieRealm.swift
//  Movie Theater App
//
//  Created by Brad on 7/6/22.
//

import Foundation
import RealmSwift

class MovieRealm : Object {
    
    @objc dynamic var name = ""
    @objc dynamic var posterPath : String?
//    @objc dynamic var vote = String(Int)
    @objc dynamic var overview = ""
    @objc dynamic var  date = ""
}
