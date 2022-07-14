//
//  DetailsViewController.swift
//  Movie Theater App
//
//  Created by Brad on 6/25/22.
//

import UIKit
import Alamofire




struct  DetailsModel {
    
    var movieTitleLabel : String
    var movieDescriptionLbl : String
    var ratingLbl : String
    var languageLbl : String
    var releaseDateLbl: String
    var movieImageView : UIImage
    
}



class DetailsViewController: UIViewController {
    
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    
    @IBOutlet weak var movieDescriptionLbl: UILabel!
    
    @IBOutlet weak var ratingLbl: UILabel!
    
    @IBOutlet weak var languageLbl: UILabel!
    
    @IBOutlet weak var movieTypeLbl: UILabel!
    @IBOutlet weak var releaseDateLbl: UILabel!
    
    @IBOutlet var viewBackGround: UIView!
    var movie: Movies?
    var tv : TV?
    var popular : PopularMedia?
    var upcoming : UpcomingMedia?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        overrideUserInterfaceStyle
        viewBackGround.backgroundColor = .red
//        configure()
        
    }
    
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        let alertController = UIAlertController(title: "Saved Movie", message: "Add to watch list", preferredStyle: .alert)
        let saved = DataManager().save(movie)
        let saveAction = UIAlertAction(title: "Save", style: .default)
        alertController.addAction(saveAction)
        let deadline = DispatchTime.now() + 1
        present(alertController, animated: true, completion: nil)
        DispatchQueue.main.asyncAfter(deadline: deadline){
            alertController.dismiss(animated: true)
            self.navigationController?.popViewController(animated: true)
            
        }
        
        
        
        
    }
    //MARK: - Switch sype. Doesn't work. ASK
    
    
//    func configure() {
//
//
//        movieTitleLabel.text = tv?.name ??
//        movie?.title ??
//        popular?.title ??
//        upcoming?.title ??
//        "Unknown"
//
//        movieDescriptionLbl.text = movie?.overview ?? tv?.overview ?? popular?.title ?? upcoming?.title ?? "Unknown"
//
//        ratingLbl.text = String(format : "%.2f", movie?.vote_average ??  tv?.vote_average ?? upcoming?.vote_average ?? popular?.vote_average ??
//                                "Unknown")
//
//        languageLbl.text = movie?.original_language ?? tv?.original_language ?? popular?.title ?? upcoming?.original_language ?? "Unknown"
//
//        movieTypeLbl.text = movie?.media_type ?? tv?.media_type ?? "Unkown"
//
//        guard let posterPath = movie?.backdrop_path else { return }
//
//        let imageURLstring = "https://image.tmdb.org/t/p/w500" + posterPath
//
//        guard let imageURL = URL(string: imageURLstring) else { return }
//
//        movieImageView.sd_setImage(with: imageURL)
//
//        releaseDateLbl.text = movie?.release_date
//
//    }
//
    
    func configureTest( model : DetailsModel) {
        movieTitleLabel.text = model.movieTitleLabel
        movieDescriptionLbl.text = model.movieDescriptionLbl
        languageLbl.text = model.languageLbl
        releaseDateLbl.text = model.releaseDateLbl
        ratingLbl.text = model.ratingLbl
        movieImageView.image = model.movieImageView
        
    }
    
   
}

