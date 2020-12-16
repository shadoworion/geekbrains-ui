//
//  GroupsController.swift
//  hw1
//
//  Created by David Dakhovich on 12/12/2020.
//

import UIKit

class GroupsController: UITableViewController {
    
    @IBOutlet var groupsTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        groupsTable.delegate = self
        groupsTable.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = groupsTable.dequeueReusableCell(withIdentifier: "GroupCell") as! GroupsCell
        
        let index = indexPath.row
        let title = groupData[index].title
        let avatar = groupData[index].avatar
        
        cell.setData(title: title, avatar: avatar)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            allGroupData.append(groupData[indexPath.row])
            
            groupData.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
