//
//  HotViewController.swift
//  Movie Theater App
//
//  Created by Brad on 6/22/22.
//

import UIKit
import Alamofire
class HotViewController: UIViewController {
    public var moviesArray : [Movies] = []
    @IBOutlet weak var hotTableView: UITableView!
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHotController()
        // Do any additional setup after loading the view.
       downloadJson()
    }
    
    func downloadJson() {
        
     let url = "https://api.themoviedb.org/3/trending/movie/week?api_key=35ac442f569f30ef7e79254f7511fb2d"
        AF.request(url).responseJSON { response in
            do{
                let decoder = JSONDecoder()
                let allData = try decoder.decode(ResultsMovies.self, from: response.data!)
                self.moviesArray = allData.results!
                DispatchQueue.main.async{
                    self.hotTableView.reloadData()
                }
                
            }catch{
                print("JSON is missing")
            }
        }
        
    }
    
    private func setupHotController() {
        overrideUserInterfaceStyle = .dark
        hotTableView.register(nibs, forCellReuseIdentifier: "cell")
        hotTableView.delegate = self
        hotTableView.dataSource = self
        segmentedControl.backgroundColor = .white
        
    }
    

}
