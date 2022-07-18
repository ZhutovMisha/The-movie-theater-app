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
        var item : Movies
        if isFiltering {
             item = filteredMovies[indexPath.row]
            
        }else {
             item = moviesArray[indexPath.row]
        }
        
        cell.configureWith(item: item )
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering{
            return filteredMovies.count
        } else {
            moviesArray.count
        }
        return 0
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let movie = moviesArray[indexPath.row]
//
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        if let viewController = storyboard.instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController{
//            viewController.movie = movie
//            guard let rootVC = UIApplication.shared.keyWindow?.rootViewController else { return }
//            rootVC.present(viewController, animated: true)
        switch type {
            
        case .movie :
            let movie = moviesArray[indexPath.row]
            let storyboard = UIStoryboard(name: "Main", bundle: nil)

            guard let viewcontroller = storyboard.instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController else { return }

            let url = URL(string: "https://image.tmdb.org/t/p/w500" + movie.poster_path!)
            let data = try? Data(contentsOf: url!)
            let image = UIImage(data: data!)

            let model = DetailsModel(movieTitleLabel: movie.title ?? "", movieDescriptionLbl: movie.overview ?? "", ratingLbl: String(format : "%.2f",movie.vote_average!) , languageLbl: movie.original_language ?? "",  releaseDateLbl: movie.release_date ?? "", movieImageView: image!)
            
            viewcontroller.loadView()
            
            viewcontroller.configureTest(model: model)
            viewcontroller.movie = movie
            pushViewController(viewContoller: viewcontroller)

        case .TV :    let tv = tvArray[indexPath.row]

            let storyboard = UIStoryboard(name: "Main", bundle: nil)

            guard let viewcontroller = storyboard.instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController else { return }
            
//                        let image = UIImageView()
//                        image.sd_setImage(with: "https://image.tmdb.org/t/p/w500" + tv.poster_path)
            
            let url = URL(string: "https://image.tmdb.org/t/p/w500" + tv.backdrop_path!)
            let data = try? Data(contentsOf: url!)
            let image = UIImage(data: data!)

            let model = DetailsModel(movieTitleLabel: tv.name ?? "" , movieDescriptionLbl: tv.overview ?? "" , ratingLbl: String(format : "%.2f",tv.vote_average!) ?? ""  , languageLbl: tv.original_language ?? "",  releaseDateLbl: tv.first_air_date ?? "", movieImageView: image!)
            
            viewcontroller.loadView()

            viewcontroller.configureTest(model: model)
            viewcontroller.tv = tv
            pushViewController(viewContoller: viewcontroller)

        case .popular:    let popular = popularArray[indexPath.row]

            let storyboard = UIStoryboard(name: "Main", bundle: nil)

            guard let viewcontroller = storyboard.instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController else { return }
            
            let url = URL(string: "https://image.tmdb.org/t/p/w500" + popular.poster_path!)
            let data = try? Data(contentsOf: url!)
            let image = UIImage(data: data!)


            let model = DetailsModel(movieTitleLabel: popular.title ?? "", movieDescriptionLbl: popular.overview ?? "", ratingLbl: String(format : "%.2f",popular.vote_average!) , languageLbl: popular.original_language ?? "" , releaseDateLbl: popular.release_date ?? "", movieImageView: image!)
            viewcontroller.loadView()

            viewcontroller.configureTest(model: model)
            viewcontroller.popular = popular
            pushViewController(viewContoller: viewcontroller)

        case .upcoming:    let upcoming = upcomingArray[indexPath.row]

            let storyboard = UIStoryboard(name: "Main", bundle: nil)

            guard let viewcontroller = storyboard.instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController else { return }
            
            let url = URL(string: "https://image.tmdb.org/t/p/w500" + upcoming.poster_path!)
            let data = try? Data(contentsOf: url!)
            let image = UIImage(data: data!)

            let model = DetailsModel(movieTitleLabel: upcoming.title ?? "" , movieDescriptionLbl: upcoming.overview ?? "" , ratingLbl: String(format : "%.2f",upcoming.vote_average!)  ?? "" , languageLbl: upcoming.original_language ?? "",  releaseDateLbl: upcoming.release_date ?? "", movieImageView: image!)
            viewcontroller.loadView()

            viewcontroller.configureTest(model: model)
            viewcontroller.upcoming = upcoming
            pushViewController(viewContoller: viewcontroller)

        default : break
        }

}

}





private func pushViewController(viewContoller: UIViewController) {
guard let rootVC = UIApplication.shared.keyWindow?.rootViewController else { return }
rootVC.present(viewContoller, animated: true)
}

    

extension SearchViewController : UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
//
        filterContentForSearchText(searchController.searchBar.text!)
    }
    
     func  filterContentForSearchText(_ searchText : String) {
         filteredMovies = moviesArray.filter({ (movie:Movies) -> Bool in
             return (movie.title?.lowercased().contains(searchText.lowercased()))!
             
         })
         searchTableView.reloadData()
        
    }
    
}
