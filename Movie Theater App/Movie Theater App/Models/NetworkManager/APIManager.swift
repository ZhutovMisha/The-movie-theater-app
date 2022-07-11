////
////  APIManager.swift
////  Movie Theater App
////
////  Created by Brad on 7/7/22.
////
//
//import Foundation
//import Alamofire
//
//class ApiManager {
//
//    static let shared = ApiManager()
////    private let networkManager = NetworkManager.shared
//    private init() { }
//
//    private let baseURL = "https://api.themoviedb.org"
//    private let APIKEY = "api_key=35ac442f569f30ef7e79254f7511fb2d"
//    private var page: Int = 1
//
//    func downloadTrendingMovies(complition: @escaping ([Movies])->(Void)) {
//
//        let url = baseURL + "3/trending/movie/week?" + APIKEY
//
////        networkManager.performRequest(url: url) { (data) in
//        AF.request(url).responseJSON { response in
//            do {
//                let decodeData = try JSONDecoder().decode(ResultsMovies.self, from: response.data!)
//                self.page += 1
//                complition(decodeData.results!)
//            } catch {
//                print(error.localizedDescription)
//            }
//
//        }
//
//    }
//
//
//}
