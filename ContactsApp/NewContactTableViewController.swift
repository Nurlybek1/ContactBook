//
//  NewContactTableViewController.swift
//  ContactsApp
//
//  Created by Nurlybek Saktagan on 05.10.2021.
//

import UIKit

class NewContactTableViewController: UITableViewController {
    
    var user = User.init("", "", UIImage.init(named: "female")!)
    
    @IBOutlet weak var nameSurnameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var genderPickerView: UIPickerView!
    @IBOutlet weak var saveButton: UIBarButtonItem!

    
    let genders = ["male", "female"]
    var gender: String = "male"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateSaveButtonState()
        
        genderPickerView.delegate = self
        genderPickerView.dataSource = self
    }
    
    // check is empty or not
    private func updateSaveButtonState() {
        let nameSurnameText = nameSurnameTextField.text ?? " "
        let phoneNumberText = phoneNumberTextField.text ?? " "
        
        saveButton.isEnabled = !nameSurnameText.isEmpty && !phoneNumberText.isEmpty
    }
    
    @IBAction func textChanged(_ sender: UITextField) {
        updateSaveButtonState()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard segue.identifier == "saveSegue" else { return }
        
        let nameSurname = nameSurnameTextField.text ?? " "
        let phoneNumber = phoneNumberTextField.text ?? " "
        
        self.user = User.init(nameSurname, phoneNumber, UIImage.init(named: gender)!)
    }
}

extension NewContactTableViewController: UIPickerViewAccessibilityDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return genders.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genders[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        gender = genders[row]
    }
}
