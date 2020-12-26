//
//  GroupsController.swift
//  hw1
//
//  Created by David Dakhovich on 12/12/2020.
//

import UIKit

class GroupsController: UITableViewController, UISearchBarDelegate {
    
    var localData = [Group]()
    
    @IBOutlet var groupsTable: UITableView!
    @IBOutlet weak var searchInput: UISearchBar!
    
    func setTableData(data: [Group]){
        localData.removeAll()
        localData.append(contentsOf: data)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTableData(data: groupData)
        
        groupsTable.delegate = self
        groupsTable.dataSource = self
        searchInput.delegate = self
        
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
         view.addGestureRecognizer(tapGesture)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if((searchInput.text) != ""){
            let filteredData = groupData.filter({$0.title.lowercased().contains((searchInput.text?.lowercased())!)})
            setTableData(data: filteredData)
        } else {
            setTableData(data: groupData)
        }
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setTableData(data: groupData)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return localData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = groupsTable.dequeueReusableCell(withIdentifier: "GroupCell") as! GroupsCell
        
        let index = indexPath.row
        let title = localData[index].title
        let avatar = localData[index].avatar
        
        cell.setData(title: title, avatar: avatar)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let index = groupData.firstIndex(where: {$0.id == localData[indexPath.row].id})
            
            allGroupData.append(groupData[index!])
            
            groupData.remove(at: index!)
            
            localData.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
