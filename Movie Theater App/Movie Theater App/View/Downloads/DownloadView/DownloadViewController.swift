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
    }
    
    private func getMovies() {
        downloadViewModel.moviesArray = dataManager.getMovies()
        downloadTableView.reloadData()
    }


}
