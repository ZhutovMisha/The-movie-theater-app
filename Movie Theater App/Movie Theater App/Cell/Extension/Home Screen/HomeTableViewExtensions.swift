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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? HomeTableViewCell else {return UITableViewCell() }
        var url = ""
        
        switch indexPath.section {
        case 0: cell.downloadMovies()
        case 1: cell.downloadTV()
        case 2: cell.downloadPopularMedia()
        case 3: cell.downloadUpcomingMedia()

        default: break
        }
        

        return cell
        
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return categories[section]
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return categories.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1

    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        guard let vc = storyboard?.instantiateViewController(withIdentifier: "DetailsHomePageViewController") as? DetailsHomePageViewController else {return }
//        navigationController?.pushViewController(vc, animated: true)
    }
    
     func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        header.textLabel?.textColor = UIColor.white
        header.textLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        header.textLabel?.frame = header.bounds
        header.textLabel?.textAlignment = .left
    }
    
}
