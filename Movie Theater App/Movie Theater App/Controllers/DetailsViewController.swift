//
//  DetailsViewController.swift
//  Movie Theater App
//
//  Created by Brad on 6/25/22.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var textLbl: UILabel!
    
    var movie: Movies?
    
    override func viewDidLoad() {
        super.viewDidLoad()
configure()
        
    }
    func configure(){
        textLbl.text = movie?.title
    }
}
