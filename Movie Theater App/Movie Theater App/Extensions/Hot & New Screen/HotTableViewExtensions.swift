

import UIKit

extension HotViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch segmentedControl.selectedSegmentIndex{
        case 0 :
            return moviesArray.count
            
        case 1:
            return tvArray.count
        default:
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = hotTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? HotTableViewCell else { return UITableViewCell () }
        
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            let item = moviesArray[indexPath.row]
            cell.configureWith(item: item)
            
            
        case 1:
            let itemTV = tvArray[indexPath.row]
            cell.configure(item: itemTV)
            
            
            
            
        default:
            return UITableViewCell()
        }
        return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch segmentedControl.selectedSegmentIndex{
        case 0 :    return " ❤️‍🔥 Everyone's Watching  Movies "
        case 1 : return "🔥 Best TV Shows"
        default : break
        }
        return " ❤️‍🔥 Everyone's Watching "
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(220)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        switch segmentedControl.selectedSegmentIndex{
        case 0 :        let movie = moviesArray[indexPath.row]
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            guard let viewController = storyboard.instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController else {return }
            viewController.movie = movie
            
            
            guard let  url = URL(string: "https://image.tmdb.org/t/p/w500" + (movie.poster_path ?? "0")) else { return }
            guard let data = try? Data(contentsOf: url) else { return }
            guard  let image = UIImage(data: data) else { return }
            
            let model = DetailsModel(movieTitleLabel: movie.title ?? "", movieDescriptionLbl: movie.overview ?? "", ratingLbl: String(format : "%.2f",movie.vote_average!) , languageLbl: movie.original_language ?? "",  releaseDateLbl: movie.release_date ?? "", movieImageView: image, movieTypeLbl: movie.media_type ?? "" )
            
            viewController.loadView()
            
            viewController.configureTest(model: model)
            viewController.movie = movie
            pushViewController(viewContoller: viewController)
            
            
            
            
            
        case 1 :
            
            let tv = tvArray[indexPath.row]
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            
            guard let viewcontroller = storyboard.instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController else { return }
            
            //                        let image = UIImageView()
            //                        image.sd_setImage(with: "https://image.tmdb.org/t/p/w500" + tv.poster_path)
            
            guard let  url = URL(string: "https://image.tmdb.org/t/p/w500" + (tv.poster_path ?? "0")) else { return }
            guard let data = try? Data(contentsOf: url) else { return }
            guard  let image = UIImage(data: data) else { return }
            
            let model = DetailsModel(movieTitleLabel: tv.name ?? "" , movieDescriptionLbl: tv.overview ?? "" , ratingLbl: String(format : "%.2f",tv.vote_average!) ?? ""  , languageLbl: tv.original_language ?? "",  releaseDateLbl: tv.first_air_date ?? "", movieImageView: image, movieTypeLbl: tv.media_type ?? "" )
            
            viewcontroller.loadView()
            
            viewcontroller.configureTest(model: model)
            viewcontroller.tv = tv
            pushViewController(viewContoller: viewcontroller)
            
        default:
            break
        }
        
    }
    private func pushViewController(viewContoller: UIViewController) {
        guard let rootVC = UIApplication.shared.keyWindow?.rootViewController else { return }
        rootVC.present(viewContoller, animated: true)
    }
    
}

