//
//  FlipVC.swift
//  random
//
//  Created by Agent X on 1/12/18.
//  Copyright © 2018 Andrii Halabuda. All rights reserved.
//

import UIKit

class FlipVC: UIViewController {

    @IBOutlet weak var coinImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func generateTapped(_ sender: CustomButton) {
        
        let randomNumber: Int
        randomNumber = Int.random(range: 0..<2)
        coinImage.image = UIImage(named: String(randomNumber))
        
        generateFeedback()
        
    }

    func generateFeedback() {
        let generator = UIImpactFeedbackGenerator(style: .light)
        generator.prepare()
        generator.impactOccurred()
    }

}
