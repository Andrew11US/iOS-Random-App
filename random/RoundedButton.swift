//
//  RoundedButton.swift
//  random
//
//  Created by Andrew Foster on 1/27/17.
//  Copyright © 2017 Andrii Halabuda. All rights reserved.
//

import UIKit

class RoundedButton: UIButton {

    override func awakeFromNib() {
        
        layer.cornerRadius = 10.0
        layer.shadowRadius = 5.0
        layer.shadowColor = UIColor.darkGray.cgColor
        
    }
    
}
