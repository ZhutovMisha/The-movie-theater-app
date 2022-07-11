////
////  NetworkManagerTest.swift
////  Movie Theater App
////
////  Created by Brad on 7/7/22.
////
//
//import Foundation
//
//class NetworkManager {
//
//    static let shared = NetworkManager()
//    private init() { }
//
//    func performRequest(url: String, success: @escaping (Data)->(), failure: @escaping (Error?)->()) {
//
//        guard let url = URL(string: url) else { failure(nil); return }
//
//        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
//
//            if let error = error { failure(error); return }
//
//            if let data = data {
//                success(data)
//            } else {
//                failure(nil)
//            }
//        }
//        task.resume()
//    }
//}
