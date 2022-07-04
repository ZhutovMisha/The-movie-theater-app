
import UIKit
import Alamofire

struct Constants {
    
    static let APIKEY = "api_key=35ac442f569f30ef7e79254f7511fb2d"
    static let baseURL = "https://api.themoviedb.org"
}

class APIcaller{
    static let shared  = APIcaller()
    
    func getTrendingMovies (completion : @escaping(String) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/all/day?\(Constants.APIKEY)") else {return }
        
    }
    
}
