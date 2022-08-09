//
//  UIVIew + extension.swift
//  Movie Theater App
//
//  Created by Brad on 8/5/22.
//

import UIKit

extension UIButton {
    
   @IBInspectable var cornerRadius : CGFloat {
        get { return cornerRadius}
        set  {self.layer.cornerRadius = newValue}
    }
}

