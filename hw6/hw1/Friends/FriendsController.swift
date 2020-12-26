//
//  FriendsController.swift
//  hw1
//
//  Created by David Dakhovich on 12/12/2020.
//

import UIKit

class FriendsController: UITableViewController, UISearchBarDelegate {
    
    var friendsDict = [String: [String]]()
    var friendsSections = [String]()
    
    @IBOutlet var friendsTable: UITableView!
    @IBOutlet weak var searchInput: UISearchBar!
    
    func setTableData() {
        friendsDict.removeAll()
        friendsSections.removeAll()
        
        for friend in friendsData {
            let friendKey = String(friend.fullname.prefix(1))
                if var friendValues = friendsDict[friendKey] {
                    friendValues.append(friend.fullname)
                    friendsDict[friendKey] = friendValues
                } else {
                    friendsDict[friendKey] = [friend.fullname]
                }
        }
        
        friendsSections = [String](friendsDict.keys)
        friendsSections = friendsSections.sorted(by: { $0 < $1 })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTableData()
        
        friendsTable.delegate = self
        friendsTable.dataSource = self
        searchInput.delegate = self
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if((searchInput.text) != ""){
            let filteredData = friendsData.filter({$0.fullname.lowercased().contains((searchInput.text?.lowercased())!)})

            friendsDict.removeAll()
            friendsSections.removeAll()
            
            for friend in filteredData {
                let friendKey = String(friend.fullname.prefix(1))
                    if var friendValues = friendsDict[friendKey] {
                        friendValues.append(friend.fullname)
                        friendsDict[friendKey] = friendValues
                    } else {
                        friendsDict[friendKey] = [friend.fullname]
                    }
            }
            
            friendsSections = [String](friendsDict.keys)
            friendsSections = friendsSections.sorted(by: { $0 < $1 })
        } else {
            setTableData()
        }
        tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return friendsSections.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let friendKey = friendsSections[section]
        if let friendValues = friendsDict[friendKey] {
            return friendValues.count
        }
        
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = friendsTable.dequeueReusableCell(withIdentifier: "FriendCell") as! FriendCell
        
        let friendKey = friendsSections[indexPath.section]
        if let friendValues = friendsDict[friendKey] {
            let getFriend = friendsData.first(where: {$0.fullname == friendValues[indexPath.row]})
            cell.setData(fullname: friendValues[indexPath.row], avatar: getFriend!.avatar)
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return friendsSections[section]
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return friendsSections
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let friendCollection = storyBoard.instantiateViewController(withIdentifier: "FriendCollection") as! FriendController
        friendCollection.title = tableView.cellForRow(at: indexPath)?.textLabel?.text
        let friend = friendsData.first(where: {$0.fullname == tableView.cellForRow(at: indexPath)?.textLabel?.text})
        friendCollection.friendId = friend!.id
        
        self.show(friendCollection, sender: self)
    }
}
