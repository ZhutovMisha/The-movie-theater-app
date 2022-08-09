//
//  HomeCollectionViewExtensions.swift
//  Movie Theater App
//
//  Created by Brad on 6/21/22.
//

import Foundation
import UIKit
import SDWebImage

extension HomeTableViewCell : UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        returnMediaCount()

    }
        
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.identifier , for: indexPath) as? HomeCollectionViewCell else { return UICollectionViewCell() }
        
        switch homeTableViewCellModel.type {
        case .movie :
            let item = homeTableViewCellModel.moviesArray[indexPath.row]
            cell.configureMovie(item: item)
            
        case .TV:
            let item = homeTableViewCellModel.tvArray[indexPath.row]
            cell.configureTV(item: item)
            
        case .popular:
            let item = homeTableViewCellModel.popularArray[indexPath.row]
            cell.configurePopular(item: item)
            
        case .upcoming: let item = homeTableViewCellModel.upcomingArray[indexPath.row]
            cell.configureUpcoming(item: item)
        default:
            break
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 140, height: 180)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: Constants.storyBoardName , bundle: nil)
        
        guard let viewcontroller = storyboard.instantiateViewController(withIdentifier: String(describing: DetailsViewController.self)) as? DetailsViewController else { return }
        
        //MARK: - ViewController Push
        
        switch homeTableViewCellModel.type {
            
        case .movie :
            let movie = homeTableViewCellModel.moviesArray[indexPath.row]
            
            
            guard let url = URL(string: Constants.Network.imageBaseURL + (movie.poster_path ?? "")) else { return }
            guard let data = try? Data(contentsOf: url) else { return }
            guard let image = UIImage(data: data) else { return }
            
            let model = DetailsModel(movieTitleLabel: movie.title ?? "", movieDescriptionLbl: movie.overview ?? "", ratingLbl: String(format : "%.2f",movie.vote_average!) , languageLbl: movie.original_language ?? "",  releaseDateLbl: movie.release_date ?? "", movieImageView: image, movieTypeLbl: movie.media_type ?? "" )
            
            viewcontroller.loadView()
            
            viewcontroller.configureTest(model: model)
            viewcontroller.movie = movie
            pushViewController(viewContoller: viewcontroller)
            
        case .TV :    let tv = homeTableViewCellModel.tvArray[indexPath.row]
            
            
            
            
            guard let url = URL(string: Constants.Network.imageBaseURL + (tv.poster_path ?? "")) else { return }
            guard let data = try? Data(contentsOf: url) else { return }
            guard let image = UIImage(data: data) else { return }
            
            let model = DetailsModel(movieTitleLabel: tv.name ?? "" , movieDescriptionLbl: tv.overview ?? "" , ratingLbl: String(format : "%.2f",tv.vote_average!) ?? ""  , languageLbl: tv.original_language ?? "",  releaseDateLbl: tv.first_air_date ?? "", movieImageView: image, movieTypeLbl: tv.media_type ?? "" )
            
            viewcontroller.loadView()
            
            viewcontroller.configureTest(model: model)
            viewcontroller.tv = tv
            pushViewController(viewContoller: viewcontroller)
            
        case .popular:    let popular = homeTableViewCellModel.popularArray[indexPath.row]
            
            
            
            guard let url = URL(string: Constants.Network.imageBaseURL + (popular.poster_path ?? "")) else { return }
            guard let data = try? Data(contentsOf: url) else { return }
            guard let image = UIImage(data: data) else { return }
            
            
            let model = DetailsModel(movieTitleLabel: popular.title ?? "", movieDescriptionLbl: popular.overview ?? "", ratingLbl: String(format : "%.2f",popular.vote_average!) , languageLbl: popular.original_language ?? "" , releaseDateLbl: popular.release_date ?? "", movieImageView: image, movieTypeLbl: "")
            viewcontroller.loadView()
            
            viewcontroller.configureTest(model: model)
            viewcontroller.popular = popular
            pushViewController(viewContoller: viewcontroller)
            
        case .upcoming:    let upcoming = homeTableViewCellModel.upcomingArray[indexPath.row]
            
            
            guard let url = URL(string: Constants.Network.imageBaseURL + (upcoming.poster_path ?? "")) else { return }
            guard let data = try? Data(contentsOf: url) else { return }
            guard let image = UIImage(data: data) else { return }
            
            let model = DetailsModel(movieTitleLabel: upcoming.title ?? "" , movieDescriptionLbl: upcoming.overview ?? "" , ratingLbl: String(format : "%.2f",upcoming.vote_average!)  ?? "" , languageLbl: upcoming.original_language ?? "",  releaseDateLbl: upcoming.release_date ?? "", movieImageView: image, movieTypeLbl: "")
            viewcontroller.loadView()
            
            viewcontroller.configureTest(model: model)
            viewcontroller.upcoming = upcoming
            pushViewController(viewContoller: viewcontroller)
            
        default : break
        }
    }
    
}





private func pushViewController(viewContoller: UIViewController) {
    if let topVC = UIApplication.getTopViewController() {
        topVC.navigationController?.pushViewController(viewContoller, animated: true) // present(viewContoller, animated: true)
    }
//    guard let rootVC = UIApplication.shared.keyWindow?.rootViewController else { return }
//    rootVC.present(viewContoller, animated: true)
}

extension UIApplication {

    class func getTopViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {

        if let nav = base as? UINavigationController {
            return getTopViewController(base: nav.visibleViewController)

        } else if let tab = base as? UITabBarController, let selected = tab.selectedViewController {
            return getTopViewController(base: selected)

        } else if let presented = base?.presentedViewController {
            return getTopViewController(base: presented)
        }
        return base
    }
}

