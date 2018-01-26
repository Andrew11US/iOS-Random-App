//
//  FlipVC.swift
//  random
//
//  Created by Agent X on 1/12/18.
//  Copyright © 2018 Andrii Halabuda. All rights reserved.
//

import UIKit

class FlipVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func generateFeedback() {
        let generator = UIImpactFeedbackGenerator(style: .light)
        generator.prepare()
        generator.impactOccurred()
    }

}
