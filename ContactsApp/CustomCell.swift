//
//  CustomCell.swift
//  ContactsApp
//
//  Created by Nurlybek Saktagan on 04.10.2021.
//

import UIKit

class CustomCell: UITableViewCell {
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userNameSurname: UILabel!
    @IBOutlet weak var userPhoneNumber: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
