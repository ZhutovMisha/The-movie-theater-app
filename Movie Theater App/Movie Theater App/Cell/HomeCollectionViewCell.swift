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
    
    func configureWith(item: Movies) {
        guard let posterPath = item.poster_path else { return }
        let imageURLstring = "https://image.tmdb.org/t/p/w400" + posterPath
        guard let imageURL = URL(string: imageURLstring) else { return }
        posterImageView.sd_setImage(with: imageURL)
    }
}
