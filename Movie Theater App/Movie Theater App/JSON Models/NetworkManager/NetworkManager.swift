
import UIKit
import Alamofire
import RealmSwift

struct Constants {
    
    static let APIKEY = "api_key=35ac442f569f30ef7e79254f7511fb2d"
    static let baseURL =  "https://api.themoviedb.org"
}

class NetworkManager {
    static let shared  = NetworkManager()
    private init() {}
    
    func performRequest( url : String  , success : @escaping (Data) -> () ,failure : @escaping(Error?) -> () ){
        guard let url = URL(string : url ) else { failure (nil) ; return  }
        
        AF.request(url).responseJSON { response in
            guard let data = response.data else { return failure(nil) }
            success(data)
        }
    }

}






