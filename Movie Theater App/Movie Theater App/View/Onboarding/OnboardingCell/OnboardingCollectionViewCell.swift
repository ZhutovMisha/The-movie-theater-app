//
//  OnboardingCollectionViewCell.swift
//  Movie Theater App
//
//  Created by Brad on 8/5/22.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
        
    @IBOutlet weak var onboardingImageView: UIImageView!
    @IBOutlet weak var onboardingDescriptionLbl: UILabel!
    
    @IBOutlet weak var onboardingTitleLbl: UILabel!
    func setup( item : OnboardingSlide) {
        onboardingImageView.image = item.image
        onboardingTitleLbl.text = item.title
        onboardingDescriptionLbl.text = item.description
        }
    
}


