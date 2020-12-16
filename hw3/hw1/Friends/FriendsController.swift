//
//  FriendsController.swift
//  hw1
//
//  Created by David Dakhovich on 12/12/2020.
//

import UIKit

class FriendsController: UITableViewController {
    
    @IBOutlet var friendsTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        friendsTable.delegate = self
        friendsTable.dataSource = self
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendsData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = friendsTable.dequeueReusableCell(withIdentifier: "FriendCell") as! FriendCell
        
        let index = indexPath.row
        let fullname = friendsData[index].fullname
        let avatar = friendsData[index].avatar
        
        cell.setData(fullname: fullname, avatar: avatar)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let friendCollection = storyBoard.instantiateViewController(withIdentifier: "FriendCollection") as! FriendController
        friendCollection.friendId = indexPath.row
        friendCollection.title = friendsData[indexPath.row].fullname
        self.show(friendCollection, sender: self)
    }
}
