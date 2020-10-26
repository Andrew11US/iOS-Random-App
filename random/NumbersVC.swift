//
//  ViewController.swift
//  random
//
//  Created by Andrew Foster on 1/27/17.
//  Copyright © 2017 Andrii Halabuda. All rights reserved.
//

import UIKit
import AudioToolbox

class NumbersVC: UIViewController {
    @IBOutlet weak var genLbl: UILabel!
    @IBOutlet weak var genBtn: CustomButton!
    @IBOutlet weak var eraseBtn: CustomButton!
    @IBOutlet weak var progressView: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        erase()
    }

    @IBAction func genBtnPressed(_ sender: CustomButton) {
        let randomNumber: Int
        
        if value1 < value2 {
            randomNumber = Int.random(range: value1..<(value2 + 1))
        } else {
            randomNumber = Int.random(range: value2..<(value1 + 1))
        }
        
        genLbl.text = String(randomNumber)
        progressView.progress = Float(Float(randomNumber)/Float(value1 + value2))
    }

    @IBAction func eraseBtnPressed(_ sender: CustomButton) {
        erase()
    }
    
    private func erase() {
        progressView.progress = 0
        genLbl.text = ""
    }
}

