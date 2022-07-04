//
//  HotTableViewCell.swift
//  Movie Theater App
//
//  Created by Brad on 6/22/22.
//

import UIKit
import SDWebImage

class HotTableViewCell: UITableViewCell {

    
    @IBOutlet weak var movieNameLbl: UILabel!
    @IBOutlet weak var posterImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configureWith(item: Movies) {
        guard let posterPath = item.poster_path else { return }
        let imageURLstring = "https://image.tmdb.org/t/p/w500" + posterPath
        guard let imageURL = URL(string: imageURLstring) else { return }
        posterImage.sd_setImage(with: imageURL)
        movieNameLbl.text = item.original_title ?? item.title ?? ""
      
        
        
    }
    func configure (item : TV) {
        movieNameLbl.text = item.original_name ?? item.name ?? ""
    }
    
  /*
    func configureTV (item : TV){
        guard let posterPath = item.poster_path else { return }
        let imageURLstring = "https://image.tmdb.org/t/p/w500" + posterPath
        guard let imageURL = URL(string: imageURLstring) else { return }
        posterImage.sd_setImage(with: imageURL)
        movieDescriptionLbl.text = item.overview ?? ""
        ratingLbl.text = String(format: "%.2f" , item.vote_average ?? "")
        movieNameLbl.text = item.name ?? item.original_name ?? ""

    }
   */
    
    
}
