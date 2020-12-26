//
//  FriendCollection.swift
//  hw1
//
//  Created by David Dakhovich on 12/12/2020.
//

import UIKit

class FriendCollection: UICollectionViewCell {
    
    @IBOutlet weak var friendImage: UIImageView!
    
    func setData(avatar: UIImage?){
        if avatar == nil {
            friendImage.image = UIImage(systemName: "person.crop.circle.fill")
        } else {
            friendImage.image = avatar
        }
    }
}
