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
    var movieTypeLbl : String
    
}



class DetailsViewController: UIViewController {
    
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    
    @IBOutlet weak var movieDescriptionLbl: UILabel!
    
    @IBOutlet weak var ratingLbl: UILabel!
    
    @IBOutlet weak var languageLbl: UILabel!
    
    @IBOutlet weak var movieTypeLbl: UILabel!
    @IBOutlet weak var releaseDateLbl: UILabel!
    
    @IBOutlet weak var watchListButton: UIButton!
    
    @IBOutlet var viewBackGround: UIView!
    
    var movie: Movies?
    var tv : TV?
    var popular : PopularMedia?
    var upcoming : UpcomingMedia?
    var realmMoviesDetails : Movies?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    }
    
    
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        
        
        let saved = DataManager().save(movie)
        let saveAction = UIAlertAction(title: "Saved", style: .default)
        
        Constants.DetailsViewModel.alertController.addAction(saveAction)
        let deadline = DispatchTime.now() + 1
        present(Constants.DetailsViewModel.alertController, animated: true, completion: nil )
        DispatchQueue.main.asyncAfter(deadline: deadline){
            Constants.DetailsViewModel.alertController.dismiss(animated: true)
            self.navigationController?.popViewController(animated: true)
            
            
        }
        
        
        
        
    }
    //MARK: - Switch sype. Doesn't work. ASK
    

//
    
    func configureTest( model : DetailsModel) {
        movieTitleLabel.text = model.movieTitleLabel
        movieDescriptionLbl.text = model.movieDescriptionLbl
        languageLbl.text = model.languageLbl
        releaseDateLbl.text = model.releaseDateLbl
        ratingLbl.text = model.ratingLbl
        movieImageView.image = model.movieImageView
        movieTypeLbl.text = model.movieTypeLbl
        movieImageView.layer.borderWidth = 1
        movieImageView.layer.borderColor = UIColor.yellow.cgColor
        movieImageView.layer.cornerRadius = 5
        
    }
    
   
}

