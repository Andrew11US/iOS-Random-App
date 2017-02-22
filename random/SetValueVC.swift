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
    
    var minValue: Int = 0
    var maxValue: Int = 99_999
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.minTextField.delegate = self
        self.maxTextField.delegate = self

        self.navigationController?.isNavigationBarHidden = false
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func minValueSet(_ sender: Any) {
        
        
        
    }
    
    @IBAction func maxValueSet(_ sender: Any) {
        
        
        
    }
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
    }
    


}
