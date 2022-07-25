//

import SDWebImage
import UIKit

class DownloadTableViewCell: UITableViewCell {

    @IBOutlet weak var imagePosterPath: UIImageView!
    
    @IBOutlet weak var movieNameLbl: UILabel!
    
    @IBOutlet weak var dateLbl: UILabel!
    
    @IBOutlet weak var ratingLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
    }
    
    func configure (_with item : MovieRealm) {
        movieNameLbl.text = item.name
        //MARK: - ERROR, how to fix.
//        ratingLbl.text = String(item.vote)
        guard let posterPath = item.posterPath else { return }
        let imageURLString = "https:image.tmdb.org/t/p/w500" + posterPath
        guard let imageURL = URL(string: imageURLString) else { return }
        imagePosterPath.sd_setImage(with: imageURL)
        dateLbl.text = item.date
        
    }
   

}
