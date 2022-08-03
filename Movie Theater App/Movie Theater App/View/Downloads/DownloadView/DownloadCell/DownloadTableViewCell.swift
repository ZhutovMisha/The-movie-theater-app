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
        guard let posterPath = item.posterPath else { return }
        let imageURLString = Constants.Network.imageBaseURL + posterPath
        guard let imageURL = URL(string: imageURLString) else { return }
        imagePosterPath.sd_setImage(with: imageURL)
        dateLbl.text = item.date
        
    }
   
    override func prepareForReuse() {
        super.prepareForReuse()
        imagePosterPath.image = nil
        dateLbl.text = nil
    }

}
