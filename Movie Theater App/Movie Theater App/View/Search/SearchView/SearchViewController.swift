//
//  SearchViewController.swift
//  Movie Theater App
//
//  Created by Brad on 6/22/22.
//
import Alamofire
import UIKit


class SearchViewController: UIViewController {
    
    
    let searchViewModel = SearchViewModel()
    
    let searchController = UISearchController(searchResultsController: nil)
    
    var isFiltering : Bool {
        return searchController.isActive && !searchBarIsEmpty
    }
    
    var searchBarIsEmpty : Bool{
        
        guard let text = searchController.searchBar.text  else { return  false   }
        return text.isEmpty
    }
    
    @IBOutlet weak var searchTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchPage()
        downloadMoviesSearch()
        // Do any additional setup after loading the view.
    }
    
    private func setupSearchPage() {
        
        // SearchController Settings
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search for a movie"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
        searchController.searchBar.searchTextField.textColor = .white
        
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
    
    func downloadMoviesSearch() {
        self.searchViewModel.downloadMovies {
            self.searchTableView.reloadData()
            
        }
        
    }
    
    
    
}

