//
//  HotViewController.swift
//  Movie Theater App
//
//  Created by Brad on 6/22/22.
//

import UIKit

class HotViewController: UIViewController {
    
    @IBOutlet weak var hotTableView: UITableView!
    
    @IBOutlet weak var segmentedControl: UISegmentedControl! {
        didSet{
            segmentedControl.setTitle("Movies", forSegmentAt: 0)
            segmentedControl.setTitle("TV Shows", forSegmentAt: 1)
        }
    }
    
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
    
    
    private func setupHotController() {
        overrideUserInterfaceStyle = .dark
        let nib = UINib(nibName: String(describing: HotTableViewCell.self), bundle: nil)
        hotTableView.register(nib, forCellReuseIdentifier: "cell")
        hotTableView.delegate = self
        hotTableView.dataSource = self
        segmentedControl.backgroundColor = .white
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .black
        appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
        
        let appearance2 = UITabBarAppearance()
        appearance2.configureWithOpaqueBackground()
        appearance2.backgroundColor = .black
        
        tabBarController?.tabBar.standardAppearance = appearance2
        tabBarController?.tabBar.scrollEdgeAppearance = tabBarController?.tabBarItem.standardAppearance
        
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
