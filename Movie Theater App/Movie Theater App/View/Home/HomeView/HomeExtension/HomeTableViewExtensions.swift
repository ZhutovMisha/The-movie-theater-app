//
//  HomeTableViewExtensions.swift
//  Movie Theater App
//
//  Created by Brad on 6/21/22.
//

import Foundation
import UIKit


extension HomeViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.identifier, for: indexPath) as? HomeTableViewCell else {return UITableViewCell() }
        
        
        switch indexPath.section {
        case 0:
            cell.homeTableViewCellModel.type = .movie
            cell.downloadMovies()
            
        case 1:
            cell.homeTableViewCellModel.type = .TV
            cell.downloadTV()
        case 2:
            cell.homeTableViewCellModel.type = .popular
            cell.downloadPopular()
            
        case 3:
            cell.homeTableViewCellModel.type = .upcoming
            cell.downloadUpcoming()
            
        default: break
        }
        

        return cell
        
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Constants.HomeViewModel.categories[section]
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return Constants.HomeViewModel.categories.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1

    }
 
    
     func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        header.textLabel?.textColor = UIColor.white
        header.textLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        header.textLabel?.frame = header.bounds
        header.textLabel?.textAlignment = .left
    }
    
}
