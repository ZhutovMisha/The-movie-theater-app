import  Foundation
import Alamofire

class APImanager {
    static let shared = APImanager()
    private let networkManager = NetworkManager.shared
    private init () {}
    
    private let  baseURL = Constants.Network.baseURL
    private let APIKEY = Constants.Network.APIKEY
    
    private let decoder = JSONDecoder()
    
    
    func downloadTrendingMovies (completion: @escaping ([Movies]) -> ()) {
        let url = baseURL + "/3/trending/movie/week?" + APIKEY
        
        networkManager.performRequest(url: url) { (data ) in
            do {
                let response = try self.decoder.decode(ResultsMovies.self, from: data)
                guard let movies = response.results else { return }
                completion(movies)
                
            } catch {
                print(error.localizedDescription)
            }
        } failure: { (error) in
            print(error?.localizedDescription )
        }
    }
    
    func downloadTV ( completion : @escaping ([TV]) -> ()) {
        
        let url = baseURL + "/3/trending/tv/week?" + APIKEY
        networkManager.performRequest(url: url) { results  in
            do {
                let response = try self.decoder.decode(ResultsTV.self, from: results )
                guard let tv = response.results else { return }
                completion(tv)
                
            } catch {
                print(error.localizedDescription)
                
            }
        } failure: { error in
            print(error?.localizedDescription)
        }

    }
    
    func downloadUpcoming(completion : @escaping([UpcomingMedia]) ->()) {
        let url = "\(Constants.Network.baseURL)/3/movie/upcoming?\(Constants.Network.APIKEY)"
        networkManager.performRequest(url: url) { results in
            do{
                let response = try self.decoder.decode(UpcomingResults.self, from: results)
                guard let upcoming = response.results else { return }
                
                completion(upcoming)
                
            }catch{
                print(error.localizedDescription)
            }
        } failure: { error in
            print(error?.localizedDescription)
        }

    }
    
    func downloadPopularMovies(completion : @escaping ([PopularMedia]) -> (Void)) {
        let url = "\(Constants.Network.baseURL)/3/movie/popular?\(Constants.Network.APIKEY)"
        networkManager.performRequest(url: url) { results in
            do{
                let response = try self.decoder.decode(ResultPopular.self, from: results)
                guard let popular = response.results else { return }
           
                completion(popular)
                
            }catch{
                print(error.localizedDescription)
            }
        } failure: { error in
            print(error?.localizedDescription)
        }

    }
}


