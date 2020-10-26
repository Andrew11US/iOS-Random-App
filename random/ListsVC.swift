//
//  ListsVC.swift
//  random
//
//  Created by Agent X on 1/12/18.
//  Copyright © 2018 Andrii Halabuda. All rights reserved.
//

import UIKit

class ListsVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var selectedLbl: CustomLabel!
    @IBOutlet weak var addItemTextField: CustomTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.addItemTextField.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        itemArray.removeAll()
        tableView.reloadData()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        if addItemTextField.text == nil || addItemTextField.text == "" || addItemTextField.text == " " {
            print(itemArray)
        } else {
            itemArray.append(addItemTextField.text!)
            tableView.reloadData()
            print(itemArray)
        }
        
        addItemTextField.text = nil
        return true
    }
    
    @IBAction func generateTapped(_ sender: CustomButton) {
        let randomNumber: Int
        
        if itemArray.count != 0 {
            randomNumber = Int.random(range: 0..<(itemArray.count))
            selectedLbl.isHidden = false
            selectedLbl.text = itemArray[randomNumber]
            generateFeedback()
        } else {
            selectedLbl.isHidden = true
        }
    }
    
    func generateFeedback() {
        let generator = UIImpactFeedbackGenerator(style: .light)
        generator.prepare()
        generator.impactOccurred()
    }
}

extension ListsVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            itemArray.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as? ItemCell {
            cell.itemLbl.text = itemArray[indexPath.row]
            return cell
        } else {
            return ItemCell()
        }
    }
}
