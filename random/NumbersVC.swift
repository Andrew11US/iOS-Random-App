//
//  ViewController.swift
//  random
//
//  Created by Andrew Foster on 1/27/17.
//  Copyright © 2017 Andrii Halabuda. All rights reserved.
//
///---Future releases---///
//-> AppleWatch app

import UIKit
import AudioToolbox

class NumbersVC: UIViewController {

    @IBOutlet weak var genLbl: UILabel!
    @IBOutlet weak var genBtn: CustomButton!
    @IBOutlet weak var eraseBtn: CustomButton!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var bgImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNeedsStatusBarAppearanceUpdate()
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        if value1 < value2 {
            slider.minimumValue = Float(value1)
            slider.maximumValue = Float(value2)
        } else {
            slider.minimumValue = Float(value2)
            slider.maximumValue = Float(value1)
        }
        
        slider.value = Float(Float(value1 + value2) / 2)
    }

    @IBAction func genBtnPressed(_ sender: CustomButton) {
        
        let randomNumber: Int
        
        if value1 < value2 {
            
            randomNumber = Int.random(range: value1..<(value2 + 1))
        } else {
            
            randomNumber = Int.random(range: value2..<(value1 + 1))
        }
        
        genLbl.text = String(randomNumber)
        slider.value = Float(randomNumber)
        
        generateFeedback()
    }

    @IBAction func eraseBtnPressed(_ sender: CustomButton) {
        
        genLbl.text = ""
        slider.value = Float(Float(value1 + value2) / 2)
        
    }
    
    @IBAction func sliderChangedValue(_ sender: UISlider) {
        
        genLbl.text = String(Int(slider.value))
        
    }
    
    @IBAction func setValueBtnPressed(_ sender: UIButton) {
    }
    
    func generateFeedback() {
        let generator = UIImpactFeedbackGenerator(style: .light)
        generator.prepare()
        generator.impactOccurred()
    }
  
}

