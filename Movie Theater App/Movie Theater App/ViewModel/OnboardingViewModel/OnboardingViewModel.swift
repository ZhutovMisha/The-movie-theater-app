//
//  OnboardingViewModel.swift
//  Movie Theater App
//
//  Created by Brad on 8/5/22.
//

import Foundation

class OnboardingViewModel  {
    
    static var slides : [OnboardingSlide] = [
        OnboardingSlide(title: "Movies", description: "Browse and Find your tonight movie with ease", image: #imageLiteral(resourceName: "1*JXB8i6O1Fq-rIaBOSJQi5g")) ,
        OnboardingSlide (title: "TV Shows", description: "Begin a new journey with a new TV Show", image: #imageLiteral(resourceName: "photo_2022-08-05 14.20.52.jpeg")),
        OnboardingSlide(title: "Favotires", description: "Save what you liked , and what to watch next as well", image: #imageLiteral(resourceName: "photo_2022-08-05 14.20.55.jpeg"))
                        
    ]
    
    static var currentPage = 0
    
}
