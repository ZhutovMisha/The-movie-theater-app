//
//  SearchTableViewCell.swift
//  Movie Theater App
//
//  Created by Brad on 6/22/22.
//

import UIKit
import SDWebImage
class SearchTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imagePosterSearch: UIImageView!
    @IBOutlet weak var movieLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureWith (item : Movies) {
        
        guard let posterPath = item.poster_path  else { return }
        let imageURLString  = Constants.Network.imageBaseURL + posterPath
        guard let imageURl = URL(string: imageURLString) else { return }
        imagePosterSearch.sd_setImage(with: imageURl)
        
        movieLbl.text = item.title ?? item.original_title ?? ""
    }
}


