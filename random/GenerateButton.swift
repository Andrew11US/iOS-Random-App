//
//  GenerateButton.swift
//  random
//
//  Created by Andrew Foster on 9/19/17.
//  Copyright © 2017 Andrii Halabuda. All rights reserved.
//

import UIKit
import pop
import AudioToolbox

class GenerateButton: UIButton {

    @IBInspectable var cornerRadius: CGFloat = 5.0 {
        didSet {
            setupView()
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            setupView()
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        didSet {
            setupView()
        }
    }
    
    @IBInspectable var fontColor: UIColor = UIColor.white {
        didSet {
            self.tintColor = fontColor
        }
    }
    
    override func awakeFromNib() {
        setupView()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupView()
    }
    
    func setupView() {
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor?.cgColor
        
        self.addTarget(self, action: #selector(GenerateButton.scaleToSmall), for: .touchDown)
        self.addTarget(self, action: #selector(GenerateButton.scaleToSmall), for: .touchDragEnter)
        self.addTarget(self, action: #selector(GenerateButton.scaleAnimation), for: .touchUpInside)
        self.addTarget(self, action: #selector(GenerateButton.scaleDefault), for: .touchDragExit)
        
        self.addTarget(self, action: #selector(GenerateButton.generateFeedback), for: .touchUpInside)
    }
    
    @objc func scaleToSmall() {
        
        let scaleAmim = POPBasicAnimation(propertyNamed: kPOPLayerScaleXY)
        scaleAmim?.toValue = NSValue(cgSize: CGSize(width: 0.9, height: 0.9))
        self.layer.pop_add(scaleAmim, forKey: "LayerScaleSmallAnimation")
        
    }
    
    @objc func scaleAnimation() {
        
        let scaleAnim = POPSpringAnimation(propertyNamed: kPOPLayerScaleXY)
        scaleAnim?.velocity = NSValue(cgPoint: CGPoint(x: 3.0, y: 3.0))
        scaleAnim?.toValue = NSValue(cgPoint: CGPoint(x: 1.0, y: 1.0))
        scaleAnim?.springBounciness = 10.0
        self.layer.pop_add(scaleAnim, forKey: "LayerScaleSmallAnimation")
        
    }
    
    @objc func scaleDefault() {
        
        let scaleAnim = POPBasicAnimation(propertyNamed: kPOPLayerScaleXY)
        scaleAnim?.toValue = NSValue(cgSize: CGSize(width: 1, height: 1))
        self.layer.pop_add(scaleAnim, forKey: "LayerScaleSmallAnimation")
    }
    
    @objc func generateFeedback() {
        
        let peek = SystemSoundID(1519)
        AudioServicesPlaySystemSound(peek)
    }

}
