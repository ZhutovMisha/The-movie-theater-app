//
//  HomeCollectionViewCell.swift
//  Movie Theater App
//
//  Created by Brad on 6/21/22.
//

import UIKit
import SDWebImage

class HomeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var posterImageView: UIImageView!
    
    func configureMovie(item: Movies) {
        guard let posterPath = item.poster_path else { return }
        let imageURLstring = Constants.Network.imageBaseURL + posterPath
        guard let imageURL = URL(string: imageURLstring) else { return }
        posterImageView.sd_setImage(with: imageURL)
        posterImageView.layer.cornerRadius = 5
        posterImageView.layer.borderColor = UIColor.white.cgColor
        posterImageView.layer.borderWidth = 0.5
        
        
    }
    
    func configureTV(item: TV) {
        
        guard let posterPath = item.poster_path else { return }
        let imageURLstring = Constants.Network.imageBaseURL + posterPath
        guard let imageURL = URL(string: imageURLstring) else { return }
        posterImageView.sd_setImage(with: imageURL)
        posterImageView.layer.cornerRadius = 5
        posterImageView.layer.borderColor = UIColor.white.cgColor
        posterImageView.layer.borderWidth = 0.5
    }
    
    func configurePopular(item: PopularMedia) {
        
        guard let posterPath = item.poster_path else { return }
        let imageURLstring = Constants.Network.imageBaseURL + posterPath
        guard let imageURL = URL(string: imageURLstring) else { return }
        posterImageView.sd_setImage(with: imageURL)
        posterImageView.layer.cornerRadius = 5
        posterImageView.layer.borderColor = UIColor.white.cgColor
        posterImageView.layer.borderWidth = 0.5
        
    }
    
    func configureUpcoming(item: UpcomingMedia) {
        
        guard let posterPath = item.poster_path else { return }
        let imageURLstring = Constants.Network.imageBaseURL + posterPath
        guard let imageURL = URL(string: imageURLstring) else { return }
        posterImageView.sd_setImage(with: imageURL)
        posterImageView.layer.cornerRadius = 5
        posterImageView.layer.borderColor = UIColor.white.cgColor
        posterImageView.layer.borderWidth = 0.5
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        posterImageView.image = nil
    }
    
    
}
