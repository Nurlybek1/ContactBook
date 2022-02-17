//
//  DetailViewController.swift
//  ContactsApp
//
//  Created by Nurlybek Saktagan on 04.10.2021.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userNameSurname: UILabel!
    @IBOutlet weak var userPhoneNumber: UILabel!
    
    var name_surname: String?
    var phone_number: String?
    var image: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameSurname.text = name_surname
        userPhoneNumber.text = phone_number
        userImage.image = image
        // Do any additional setup after loading the view.
    }
    
    @IBAction func callPressed(_ sender: UIButton) {
        print("Call button pressed")
    }
    @IBAction func closePressed(_ sender: UIButton) {
//        work only with present modally
//        self.dismiss(animated: true, completion: nil)
        
        // Navigation controller is a stack If you want remove element from stack use method pop
        print("Delete button pressed")
        navigationController?.popViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
