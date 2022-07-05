//
//  SearchTableViewExtensions.swift
//  Movie Theater App
//
//  Created by Brad on 6/22/22.
//

import Foundation
import UIKit

extension SearchViewController : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? SearchTableViewCell else {return UITableViewCell() }
        let item = moviesArray[indexPath.row]
        
        cell.configureWith(item: item )
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesArray.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = moviesArray[indexPath.row]
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let viewController = storyboard.instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController{
            viewController.movie = movie
            guard let rootVC = UIApplication.shared.keyWindow?.rootViewController else { return }
            rootVC.present(viewController, animated: true)
        }
    }
    
    
}
