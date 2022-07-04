//
//  DetailsViewController.swift
//  Movie Theater App
//
//  Created by Brad on 6/25/22.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    
    @IBOutlet weak var movieDescriptionLbl: UILabel!
    
    @IBOutlet weak var ratingLbl: UILabel!
    
    @IBOutlet weak var languageLbl: UILabel!
    
    @IBOutlet weak var movieTypeLbl: UILabel!
    @IBOutlet weak var releaseDateLbl: UILabel!
    
    var movie: Movies?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .dark
configure()
        
    }
    func configure(){
        movieTitleLabel.text = movie?.title
        movieDescriptionLbl.text = movie?.overview
        ratingLbl.text = String(format : "%.2f", movie?.vote_average ?? "")
        languageLbl.text = movie?.original_language
        movieTypeLbl.text = movie?.media_type
        guard let posterPath = movie?.poster_path else { return }
        let imageURLstring = "https://image.tmdb.org/t/p/w500" + posterPath
        guard let imageURL = URL(string: imageURLstring) else { return }
        movieImageView.sd_setImage(with: imageURL)
        releaseDateLbl.text = movie?.release_date
    }
}
