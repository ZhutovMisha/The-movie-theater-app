//
//  DownloadViewController.swift
//  Movie Theater App
//
//  Created by Brad on 7/5/22.
//

import UIKit

class DownloadViewController: UIViewController {

    var moviesArray : [MovieRealm] = []
    private let dataManager = DataManager()
    
    @IBOutlet weak var downloadTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        getMovies()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getMovies()
        
    }
    private func setupUI() {
        downloadTableView.delegate = self
        downloadTableView.dataSource = self
    }
    
    private func getMovies() {
        moviesArray = dataManager.getMovies()
        downloadTableView.reloadData()
    }


}
extension DownloadViewController : UITableViewDelegate, UITableViewDataSource  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesArray.count
    }
            
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as?  DownloadTableViewCell else  { return UITableViewCell()}
        let item = moviesArray[indexPath.row]
        cell.configure(_with: item)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Saved Movies"
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = moviesArray[indexPath.row]
         let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let identifier = String(describing: DetailsViewController.self )
        guard  let viewContoller = storyBoard.instantiateViewController(withIdentifier: identifier) as? DetailsViewController else { return }
        
//        viewContoller.movie = movie
        
        pushViewController(viewContoller: viewContoller)
    }
    
}

private func pushViewController(viewContoller: UIViewController) {
    guard let rootVC = UIApplication.shared.keyWindow?.rootViewController else { return }
    rootVC.present(viewContoller, animated: true)
}
