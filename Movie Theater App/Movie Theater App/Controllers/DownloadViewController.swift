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
      

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        moviesArray = DataManager().getMovies()
        downloadTableView.reloadData()
        
    }
    private func setupUI() {
        overrideUserInterfaceStyle = .dark
        downloadTableView.delegate = self
        downloadTableView.dataSource = self
    
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

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
        cell.movieNameLbl.text = item.name
        
        return cell
    }
}
