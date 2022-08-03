//
//  DownloadExtension.swift
//  Movie Theater App
//
//  Created by Brad on 7/27/22.
//

import Foundation
import UIKit

extension DownloadViewController : UITableViewDelegate, UITableViewDataSource  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return downloadViewModel.moviesArray.count
    }
            
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(Constants.DownloadViewModel.cellHeight)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.identifier, for: indexPath) as?  DownloadTableViewCell else  { return UITableViewCell()}
        let item = downloadViewModel.moviesArray[indexPath.row]
        
        cell.configure(_with: item)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Constants.DownloadViewModel.titleForHeader
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let movie = downloadViewModel.moviesArray[indexPath.row]
        let storyBoard = UIStoryboard(name: Constants.storyBoardName, bundle: nil)
        let identifier = String(describing: DetailsViewController.self )
        guard  let viewContoller = storyBoard.instantiateViewController(withIdentifier: identifier) as? DetailsViewController else { return }
                pushViewController(viewContoller: viewContoller)
    }
    
}

private func pushViewController(viewContoller: UIViewController) {
    guard let rootVC = UIApplication.shared.keyWindow?.rootViewController else { return }
    rootVC.present(viewContoller, animated: true)
}

