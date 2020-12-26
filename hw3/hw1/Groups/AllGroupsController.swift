//
//  AllGroupsController.swift
//  hw1
//
//  Created by David Dakhovich on 12/12/2020.
//

import UIKit

class AllGroupsController: UITableViewController {
    
    @IBOutlet var allGroupsTabel: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        allGroupsTabel.delegate = self
        allGroupsTabel.dataSource = self
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allGroupData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = allGroupsTabel.dequeueReusableCell(withIdentifier: "AllGroupCell") as! AllGroupsCell
        
        let index = indexPath.row
        let title = allGroupData[index].title
        let avatar = allGroupData[index].avatar
        
        cell.setData(title: title, avatar: avatar)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

        let addAction = UIContextualAction(style: .normal, title: "Add") {(action, view, completion) in
            groupData.append(allGroupData[indexPath.row])
            
            allGroupData.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    
        addAction.backgroundColor = .systemBlue
        
        return UISwipeActionsConfiguration(actions: [addAction])
    }
}
