//
//  HotTableViewCell.swift
//  Movie Theater App
//
//  Created by Brad on 6/22/22.
//

import UIKit
import SDWebImage

class HotTableViewCell: UITableViewCell {

    @IBOutlet weak var movieDescriptionLbl: UILabel!
    @IBOutlet weak var ratingLbl: UILabel!
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
        ratingLbl.text = String(format: "%.2f" , item.vote_average ?? "")
        movieDescriptionLbl.text = item.overview
        
    }
    
}
