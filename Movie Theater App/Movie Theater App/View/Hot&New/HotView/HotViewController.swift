//
//  HotViewController.swift
//  Movie Theater App
//
//  Created by Brad on 6/22/22.
//

import UIKit
import Alamofire
class HotViewController: UIViewController {
    
    @IBOutlet weak var hotTableView: UITableView!
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    let hotViewModel = HotViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHotController()
        downloadJsonMovies()
        donwloadTrendingTV()
    }
    
    
    func downloadJsonMovies() {
        
        let url = "\(Constants.baseURL)/3/movie/upcoming?\(Constants.APIKEY)"
        AF.request(url).responseJSON { response in
            do{
                let decoder = JSONDecoder()
                let allData = try decoder.decode(ResultsMovies.self, from: response.data!)
                self.hotViewModel.moviesArray = allData.results!
                DispatchQueue.main.async{
                    self.hotTableView.reloadData()
                }
                
            }catch{
                print(error.localizedDescription)
            }
        }
        
    }
    
    func donwloadTrendingTV() {
        
        let url = "\(Constants.baseURL)/3/trending/tv/week?\(Constants.APIKEY)"
        AF.request(url).responseJSON { response in
            do{
                let decoder = JSONDecoder()
                let allData = try decoder.decode(ResultsTV.self, from: response.data!)
                self.hotViewModel.tvArray = allData.results!
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
        let nib = UINib(nibName: String(describing: HotTableViewCell.self), bundle: nil)
        hotTableView.register(nib, forCellReuseIdentifier: "cell")
        hotTableView.delegate = self
        hotTableView.dataSource = self
        segmentedControl.backgroundColor = .white
        
    }
    
    
    @IBAction func didTapSegmentedControl(_ sender: UISegmentedControl) {
        
        
        switch sender.selectedSegmentIndex {
        case 0: downloadJsonMovies()
            break
        case 1: donwloadTrendingTV()
            
            
        default:
            break
        }
    }
    
}
