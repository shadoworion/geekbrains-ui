//
//  GroupsCell.swift
//  hw1
//
//  Created by David Dakhovich on 12/12/2020.
//

import UIKit

class GroupsCell: UITableViewCell {

    @IBOutlet weak var groupLabel: UILabel!
    @IBOutlet weak var groupAvatar: UIImageView!
    
    func setData(title: String, avatar: UIImage?){
        groupLabel.text = title
        if avatar == nil {
            groupAvatar.image = UIImage(systemName: "person.2.square.stack.fill")
        } else {
            groupAvatar.image = avatar
        }
    }
}
