//
//  SearchViewController.swift
//  Movie Theater App
//
//  Created by Brad on 6/22/22.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var searchTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchPage()
        // Do any additional setup after loading the view.
    }
    private func setupSearchPage() {
        let searchController = UISearchController()
        navigationItem.searchController = searchController
        overrideUserInterfaceStyle = .dark
        
        searchTableView.dataSource = self
        searchTableView.delegate = self
        
        
    }

  

}
