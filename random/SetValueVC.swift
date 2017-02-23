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
        let value = minTextField.text
        print(value!)
    }
    
    @IBAction func maxValueSet(_ sender: Any) {
        let value = maxTextField.text
        print(value!)
    }
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
    }


}
