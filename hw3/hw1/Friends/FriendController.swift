//
//  FriendController.swift
//  hw1
//
//  Created by David Dakhovich on 12/12/2020.
//

import UIKit

class FriendController: UICollectionViewController {
    
    @IBOutlet var friendCollection: UICollectionView!
    
    public var friendId: Int = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        friendCollection.delegate = self
        friendCollection.dataSource = self
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return friendsData[friendId].images.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = friendCollection.dequeueReusableCell(withReuseIdentifier: "FriendCollect", for: indexPath) as! FriendCollection
        
        let index = indexPath.row
        let avatar = friendsData[friendId].images[index]
        
        cell.setData(avatar: avatar)
        
        return cell
    }

}
