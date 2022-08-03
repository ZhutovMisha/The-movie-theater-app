//
//  HotViewController.swift
//  Movie Theater App
//
//  Created by Brad on 6/22/22.
//

import UIKit

class HotViewController: UIViewController {
    
    @IBOutlet weak var hotTableView: UITableView!
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    let hotViewModel = HotViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHotController()
        downloadMovies()
        downloadTV()
        
        
    }
    
    
    func downloadTV() {
        self.hotViewModel.downloadTV {
            self.hotTableView.reloadData()
        }
        
    }
    
    func downloadMovies () {
        self.hotViewModel.downloadMovies {
            self.hotTableView.reloadData()
        }
    }
    
    //    func downloadJsonMovies() {
    //
    //        let url = "\(Constants.Network.baseURL)/3/movie/upcoming?\(Constants.Network.APIKEY)"
    //        AF.request(url).responseJSON { response in
    //            do{
    //                let decoder = JSONDecoder()
    //                let allData = try decoder.decode(ResultsMovies.self, from: response.data!)
    //                self.hotViewModel.moviesArray = allData.results!
    //                DispatchQueue.main.async{
    //                    self.hotTableView.reloadData()
    //                }
    //
    //            }catch{
    //                print(error.localizedDescription)
    //            }
    //        }
    //
    //    }
    //
    //    func donwloadTrendingTV() {
    //
    //        let url = "\(Constants.Network.baseURL)/3/trending/tv/week?\(Constants.Network.APIKEY)"
    //        AF.request(url).responseJSON { response in
    //            do{
    //                let decoder = JSONDecoder()
    //                let allData = try decoder.decode(ResultsTV.self, from: response.data!)
    //                self.hotViewModel.tvArray = allData.results!
    //                DispatchQueue.main.async{
    //                    self.hotTableView.reloadData()
    //                }
    //
    //            }catch{
    //                print("JSON is missing")
    //            }
    //        }
    //
    //    }
    
    private func setupHotController() {
        overrideUserInterfaceStyle = .dark
        let nib = UINib(nibName: String(describing: HotTableViewCell.self), bundle: nil)
        hotTableView.register(nib, forCellReuseIdentifier: "cell")
        hotTableView.delegate = self
        hotTableView.dataSource = self
        segmentedControl.backgroundColor = .white
        
    }
    
    func  returnMediaCount() -> Int {
        switch segmentedControl.selectedSegmentIndex{
        case 0 : return hotViewModel.moviesArray.count
        case 1: return hotViewModel.tvArray.count
            
        default:
            return 0
        }
    }
    
    func returnTitle () -> String  {
        switch segmentedControl.selectedSegmentIndex{
            case 0 :    return " ❤️‍🔥 Everyone's Watching  Movies "
            case 1 : return "🔥 Best TV Shows"
            default : break
            }
            return " ❤️‍🔥 Everyone's Watching "
        }
    
    
    @IBAction func didTapSegmentedControl(_ sender: UISegmentedControl) {
        
        
        switch sender.selectedSegmentIndex {
        case 0: downloadMovies()
            break
        case 1: downloadTV()
            
            
        default:
            break
        }
    }
    
}
