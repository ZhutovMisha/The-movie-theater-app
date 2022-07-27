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
            item = searchViewModel.filteredMovies[indexPath.row]
            
        }else {
            item = searchViewModel.moviesArray[indexPath.row]
        }
        
        cell.configureWith(item: item )
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering{
            return searchViewModel.filteredMovies.count
        } else {
            return searchViewModel.moviesArray.count
        }
//        return 0
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        var movie: Movies {
            if isFiltering{
                return searchViewModel.filteredMovies[indexPath.row]
            } else {
                return searchViewModel.moviesArray[indexPath.row]
            }
        }
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        guard let viewcontroller = storyboard.instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController else { return }

        let url = URL(string: "https://image.tmdb.org/t/p/w500" + movie.poster_path!)
        let data = try? Data(contentsOf: url!)
        let image = UIImage(data: data!)

        let model = DetailsModel(movieTitleLabel: movie.title ?? "", movieDescriptionLbl: movie.overview ?? "", ratingLbl: String(format : "%.2f",movie.vote_average!) , languageLbl: movie.original_language ?? "",  releaseDateLbl: movie.release_date ?? "", movieImageView: image!, movieTypeLbl: movie.media_type ?? "" )
        
        viewcontroller.loadView()
        
        viewcontroller.configureTest(model: model)
        viewcontroller.movie = movie
        pushViewController(viewContoller: viewcontroller)



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
         searchViewModel.filteredMovies = searchViewModel.moviesArray.filter({ (movie:Movies) -> Bool in
             return (movie.title?.lowercased().contains(searchText.lowercased()))!
             
         })
         searchTableView.reloadData()
        
    }
    
}
