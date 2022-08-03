//
//  Constants.swift
//  Movie Theater App
//
//  Created by Brad on 8/3/22.
//

import Foundation
import UIKit

struct Constants {
    
     static let storyBoardName = "Main"
     static let identifier = "cell"
    
    struct Network {
        
        static let APIKEY = "api_key=35ac442f569f30ef7e79254f7511fb2d"
        static let baseURL =  "https://api.themoviedb.org"
        static let imageBaseURL = "https://image.tmdb.org/t/p/w500"
        
    }
    struct UI {
        static let circleImage = "m.circle.fill"
        static let personImage = "person"
        static let playImage = "play.circle"
        static let height = 220 
    }
    struct HomeViewModel{
        static let categories = ["Trending Movies" , "Trending TV", "Popular", "Top Rated" ]
    }
    
    
    struct DownloadViewModel {
        
       static let cellHeight = 200
        static let titleForHeader = "Saved Movies"
    
        
    }
    
    struct DetailsViewModel {
        static let alertController = UIAlertController(title: "Saved Movie", message: "Add to watch list", preferredStyle: .alert)
        
    }
    
    struct searchViewModel {
        let searchController = UISearchController(searchResultsController: nil)

    }
    
}
