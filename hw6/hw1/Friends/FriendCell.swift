//
//  FriendCell.swift
//  hw1
//
//  Created by David Dakhovich on 12/12/2020.
//

import UIKit

class FriendCell: UITableViewCell {

    @IBOutlet weak var fullnameLabel: UILabel!
    @IBOutlet weak var avatarImage: UIImageView!
    
    func setData(fullname: String, avatar: UIImage?){
        fullnameLabel.text = fullname
        if avatar == nil {
            avatarImage.image = UIImage(systemName: "person.crop.circle.fill")
        } else {
            avatarImage.image = avatar
        }
    }
}
