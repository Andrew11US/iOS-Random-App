//
//  AddItemVC.swift
//  random
//
//  Created by Agent X on 1/12/18.
//  Copyright © 2018 Andrii Halabuda. All rights reserved.
//

import UIKit

class AddItemVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var addItemTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.addItemTextField.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    @IBAction func addBtnPressed(_ sender: UIButton) {
        
        if addItemTextField.text == nil || addItemTextField.text == "" || addItemTextField.text == " " {
            
            print(itemArray)
            
        } else {
            itemArray.append(addItemTextField.text!)
            print(itemArray)
        }
        
        dismiss(animated: true, completion: nil)
    }

}
