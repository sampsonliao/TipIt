//
//  CustomColors.swift
//  TipIt
//
//  Created by Sampson Liao on 1/26/19.
//  Copyright © 2019 sliao. All rights reserved.
//

import UIKit
extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        self.init(red: CGFloat(red) / 255, green: CGFloat(green) / 255, blue: CGFloat(blue) / 255, alpha: 1)
    }
    
    
}

