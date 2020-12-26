//
//  AllGroupsCell.swift
//  hw1
//
//  Created by David Dakhovich on 12/12/2020.
//

import UIKit

class AllGroupsCell: UITableViewCell {

    @IBOutlet weak var allGroupLabel: UILabel!
    @IBOutlet weak var allGroupAvatar: UIImageView!
    
    func setData(title: String, avatar: UIImage?){
        allGroupLabel.text = title
        if avatar == nil {
            allGroupAvatar.image = UIImage(systemName: "person.2.square.stack.fill")
        } else {
            allGroupAvatar.image = avatar
        }
    }

}
