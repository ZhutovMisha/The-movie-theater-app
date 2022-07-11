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
    @objc dynamic var imagePath = ""
//    @objc dynamic var vote = 0
    @objc dynamic var overview = ""
    @objc dynamic var  date = ""
}
