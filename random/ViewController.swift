//
//  ViewController.swift
//  random
//
//  Created by Andrew Foster on 1/27/17.
//  Copyright © 2017 Andrii Halabuda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var genLbl: UILabel!
    @IBOutlet weak var genBtn: RoundedButton!
    @IBOutlet weak var eraseBtn: RoundedButton!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var bgImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func genBtnPressed(_ sender: RoundedButton) {
        
        let randomNumber = arc4random_uniform(99999)
        genLbl.text = String(randomNumber)
        slider.value = Float(randomNumber)
        
    }

    @IBAction func eraseBtnPressed(_ sender: RoundedButton) {
        
        genLbl.text = ""
        slider.value = 50_000
        
    }
    
    @IBAction func sliderChangedValue(_ sender: UISlider) {
        
        genLbl.text = String(Int(slider.value))
        
    }
    
}

