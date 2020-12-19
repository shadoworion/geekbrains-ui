//
//  CustomAlphabetTableView.swift
//  hw4
//
//  Created by David Dakhovich on 19/12/2020.
//

import UIKit

class CustomAlphabetTableView: UITableViewController {
    
    var friendsDict = [String: [String]]()
    var friendsSections = [String]()
    var friends = [String]()

    @IBOutlet var friendsTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        friends = ["Vasya Pupkin", "Petya Petrov", "Anton Antonov", "Ivan Ivanov", "Lorem Ipsum"]
        

        for friend in friends {
            let friendKey = String(friend.prefix(1))
                if var friendValues = friendsDict[friendKey] {
                    friendValues.append(friend)
                    friendsDict[friendKey] = friendValues
                } else {
                    friendsDict[friendKey] = [friend]
                }
        }
        

        friendsSections = [String](friendsDict.keys)
        friendsSections = friendsSections.sorted(by: { $0 < $1 })
        
        friendsTable.delegate = self
        friendsTable.dataSource = self
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! AlphabetCell
        
        let friendKey = friendsSections[indexPath.section]
        if let friendValues = friendsDict[friendKey] {
            cell.setData(fullname: friendValues[indexPath.row])
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return friendsSections[section]
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return friendsSections
    }

}
