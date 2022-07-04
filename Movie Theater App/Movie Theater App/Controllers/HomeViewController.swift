//
//  ViewController.swift
//  Movie Theater App
//
//  Created by Brad on 6/21/22.
//

import UIKit
import Alamofire


class HomeViewController: UIViewController {
    public var moviesArray : [Movies] = []

    @IBOutlet weak var homeTapBarItem: UITabBarItem!
    @IBOutlet weak var homeTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configureNavBar()
        
        // Do any additional setup after loading the view
    }
    
    //MARK: - Private
    
    private func setupUI() {
         homeTableView.delegate = self
        homeTableView.dataSource = self
        overrideUserInterfaceStyle = .dark
        
    }
    private func configureNavBar() {
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "m.circle.fill"), style: .done, target: self, action: nil)
        navigationItem.rightBarButtonItems = [UIBarButtonItem(image: UIImage(systemName:"person"), style: .done, target: self, action: nil),
                                              UIBarButtonItem(image: UIImage(systemName: "play.circle"), style: .done, target: self, action: nil)]
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


}

