import UIKit
import Alamofire

class NetworkManager {
    static let shared  = NetworkManager()
    private init() {}
    
    func performRequest( url : String, success : @escaping (Data) -> () ,failure : @escaping(Error?) -> () ){
        guard let url = URL(string : url ) else { failure (nil) ; return  }
        
        AF.request(url).responseJSON { response in
            guard let data = response.data else { return failure(nil) }
            success(data)
        }
    }
    
}






