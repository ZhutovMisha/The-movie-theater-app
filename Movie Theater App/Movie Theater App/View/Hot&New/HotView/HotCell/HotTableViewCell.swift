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
        let imageURLstring = Constants.Network.imageBaseURL + posterPath
        guard let imageURL = URL(string: imageURLstring) else { return }
        posterImage.sd_setImage(with: imageURL)
        movieNameLbl.text = item.title ?? item.original_title ?? " Unkown"
      
        
        
    }
    func configure (item : TV) {
        movieNameLbl.text = item.original_name ?? item.name ?? ""
        guard let posterPath = item.poster_path else { return }
        let imageURLstring = Constants.Network.imageBaseURL + posterPath
        guard let imageURL = URL(string: imageURLstring) else { return }
        posterImage.sd_setImage(with: imageURL)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        movieNameLbl.text = nil
        posterImage.image = nil 
    }
    
    
}
