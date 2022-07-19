//
//  DownloadViewController.swift
//  Movie Theater App
//
//  Created by Brad on 7/5/22.
//

import UIKit

class DownloadViewController: UIViewController {

    var moviesArray : [MovieRealm] = []
    
    @IBOutlet weak var downloadTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        moviesArray = DataManager().getMovies()
        downloadTableView.reloadData()
        print(MovieRealm.self)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        moviesArray = DataManager().getMovies()
//        downloadTableView.reloadData()
        
    }
    private func setupUI() {
        overrideUserInterfaceStyle = .dark
        downloadTableView.delegate = self
        downloadTableView.dataSource = self
    
        
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
//        cell.configure(_with: item)
        cell.movieNameLbl.text = item.name ?? item.overview ?? item.date ?? "UNKOWN"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Saved Movies"
    }
}
