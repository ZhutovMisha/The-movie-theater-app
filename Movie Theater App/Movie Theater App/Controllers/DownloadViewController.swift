//
//  DownloadViewController.swift
//  Movie Theater App
//
//  Created by Brad on 7/5/22.
//

import UIKit

class DownloadViewController: UIViewController {

    @IBOutlet weak var downloadTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
        return 5
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 200
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as?  DownloadTableViewCell else  { return UITableViewCell()}
        
        return cell
    }
}
