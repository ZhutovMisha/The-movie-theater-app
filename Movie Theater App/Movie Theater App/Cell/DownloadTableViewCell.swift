//

import SDWebImage
import UIKit

class DownloadTableViewCell: UITableViewCell {

    @IBOutlet weak var imagePosterPath: UIImageView!
    
    @IBOutlet weak var movieNameLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
    }
    
    func configure (_with item : MovieRealm) {
        movieNameLbl.text = item.name
        //MARK: - ERROR, how to fix.
        
        
//        guard let posterPath = item.imagePath else { return }
//        let imageURLString = "https:image.tmdb.org/t/p/w500" + posterPath
//        guard let imageURL = URL(string: imageURLString) else { return }
//        imagePosterPath.sd_setImage(with: imageURL)
    }
   

}
