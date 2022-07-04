//
//  HotTableViewExtensions.swift
//  Movie Theater App
//
//  Created by Brad on 6/22/22.
//

import UIKit

extension HotViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = hotTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? HotTableViewCell else { return UITableViewCell () }
        let item = moviesArray[indexPath.row]
        let itemTV = tvArray[indexPath.row]
        cell.configureWith(item: item)
        cell.configure(item: itemTV)
        

        return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return " ❤️‍🔥 Everyone's Watching "
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(200)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
             let movie = moviesArray[indexPath.row]
//            let tvitem = tvArray[indexPath.row]
             
             let storyboard = UIStoryboard(name: "Main", bundle: nil)
             if let viewController = storyboard.instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController{
                 viewController.movie = movie
                 guard let rootVC = UIApplication.shared.keyWindow?.rootViewController else { return }
                 rootVC.present(viewController, animated: true)
             }
    }
    
}
