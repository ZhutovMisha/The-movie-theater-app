//
//  DownloadViewController.swift
//  Movie Theater App
//
//  Created by Brad on 7/5/22.
//

import UIKit

class DownloadViewController: UIViewController {

    let downloadViewModel = DownloadViewModel()
    
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
    
    private func getMovies() {
        downloadViewModel.moviesArray = dataManager.getMovies()
        downloadTableView.reloadData()
    }


}
