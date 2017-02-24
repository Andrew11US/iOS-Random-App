//
//  SetValueVC.swift
//  random
//
//  Created by Andrew Foster on 2/22/17.
//  Copyright © 2017 Andrii Halabuda. All rights reserved.
//

import UIKit

class SetValueVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var minTextField: CustomTextField!
    @IBOutlet weak var maxTextField: CustomTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.minTextField.text = String(value1)
        self.maxTextField.text = String(value2)
        
        self.minTextField.delegate = self
        self.maxTextField.delegate = self

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func minValueSet(_ sender: Any) {
        
        setMinValue()
        
    }
    
    @IBAction func maxValueSet(_ sender: Any) {
        
        setMaxValue()
        
    }
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
    }
    
    func setMinValue() {
        
        if minTextField.text == nil || minTextField.text == "" {
            
            value1 = 0
            minTextField.text = String(value1)
            print(value1)
        } else {

            value1 = Int(minTextField.text!)!
            print(value1)
        }
        
    }
    
    func setMaxValue() {
        
        if maxTextField.text == nil || maxTextField.text == "" {
            
            value2 = 99
            maxTextField.text = String(value2)
            print(value2)
        } else {
            
            value2 = Int(maxTextField.text!)!
            print(value2)
        }
        
    }
    
}
