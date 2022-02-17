//
//  ViewController.swift
//  ContactsApp
//
//  Created by Nurlybek on 04.10.2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var users = [
        User.init("Aidarov Alibek", "87085110007", UIImage.init(named: "male")!),
        User.init("James Bond", "87085110007", UIImage.init(named: "female")!),
    ]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "myCell") as? CustomCell
        cell?.userNameSurname.text = users[indexPath.row].name_surname
        cell?.userPhoneNumber.text = users[indexPath.row].phone_number
        cell?.userImageView.image = users[indexPath.row].image
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myTableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            users.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        guard segue.identifier == "saveSegue" else {
            return
        }
        
        let sourceVC = segue.source as! NewContactTableViewController
        let user = sourceVC.user
        
        let newIndexPath = IndexPath(row: users.count, section: 0)
        
        users.append(user)
        
        myTableView.insertRows(at: [newIndexPath ], with: .fade)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "mySeque" else {
            return
        }
        
        let index = (myTableView.indexPathForSelectedRow?.row)!
        let destination = segue.destination as! DetailViewController
        destination.name_surname = users[index].name_surname
        destination.phone_number = users[index].phone_number
        destination.image = users[index].image
    }
}

