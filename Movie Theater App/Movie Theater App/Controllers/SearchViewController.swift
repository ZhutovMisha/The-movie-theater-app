//
//  SearchViewController.swift
//  Movie Theater App
//
//  Created by Brad on 6/22/22.
//
import Alamofire
import UIKit


class SearchViewController: UIViewController {
     var moviesArray : [Movies] = []

    @IBOutlet weak var searchTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchPage()
        downloadJsonMoviesSearch()
        
        // Do any additional setup after loading the view.
    }
    
    private func setupSearchPage() {
        let searchController = UISearchController()
//        searchController.searchBar.searchBarStyle = .minimal
        navigationItem.searchController = searchController
        
        
        overrideUserInterfaceStyle = .dark
        
        searchTableView.dataSource = self
        searchTableView.delegate = self
        
        navigationController?.navigationBar.tintColor = .white
        
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
    
    func downloadJsonMoviesSearch() {
        
        let url = "https://api.themoviedb.org/3/movie/popular?api_key=35ac442f569f30ef7e79254f7511fb2d&language=en-US&page=1"
        AF.request(url).responseJSON { response in
            do{
                let decoder = JSONDecoder()
                let allData = try decoder.decode(ResultsMovies.self, from: response.data!)
                self.moviesArray = allData.results!
                DispatchQueue.main.async{
                    self.searchTableView.reloadData()
                }
                
            }catch{
                print("JSON is missing")
            }
        }
        
    }
    
  
  

}
