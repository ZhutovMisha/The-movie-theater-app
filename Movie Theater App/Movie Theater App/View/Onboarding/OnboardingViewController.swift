//
//  OnboardingViewController.swift
//  Movie Theater App
//
//  Created by Brad on 8/5/22.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBOutlet weak var onboardingCollectionView: UICollectionView!
    @IBOutlet weak var nextBtn: UIButton!
    
    let onboardingViewModel = OnboardingViewModel()
    
    
    let slides = OnboardingViewModel.slides
    var currentPage = 0 {
        didSet {
            
            pageControl.currentPage = currentPage
                      if currentPage == slides.count - 1 {
                          nextBtn.setTitle("Get Started", for: .normal)
                      } else {
                          nextBtn.setTitle("Next", for: .normal)
                      }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        
        // Do any additional setup after loading the view.
    }
    
    
    private func setupUI() {
        
        onboardingCollectionView.delegate = self
        onboardingCollectionView.dataSource = self
    }
    @IBAction func pressedNextBtn(_ sender: UIButton) {
        
        if currentPage == slides.count - 1 {
            print("Go to next screen")
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            guard let viewContoller = storyBoard.instantiateViewController(withIdentifier: "StartingPage") as? UITabBarController else { return }
            viewContoller.modalTransitionStyle = .flipHorizontal
            viewContoller.modalPresentationStyle = .fullScreen
            present(viewContoller, animated: true, completion: nil)
            
            
        } else {
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            onboardingCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
    
    
}


