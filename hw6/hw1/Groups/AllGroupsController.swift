//
//  AllGroupsController.swift
//  hw1
//
//  Created by David Dakhovich on 12/12/2020.
//

import UIKit

class AllGroupsController: UITableViewController, UISearchBarDelegate {
    
    var localData = [Group]()
    
    @IBOutlet var allGroupsTabel: UITableView!
    @IBOutlet weak var searchInput: UISearchBar!
    
    func setTableData(data: [Group]){
        localData.removeAll()
        localData.append(contentsOf: data)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTableData(data: allGroupData)

        allGroupsTabel.delegate = self
        allGroupsTabel.dataSource = self
        searchInput.delegate = self
        
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
         view.addGestureRecognizer(tapGesture)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if((searchInput.text) != ""){
            let filteredData = allGroupData.filter({$0.title.lowercased().contains((searchInput.text?.lowercased())!)})
            setTableData(data: filteredData)
        } else {
            setTableData(data: allGroupData)
        }
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setTableData(data: allGroupData)
        tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return localData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = allGroupsTabel.dequeueReusableCell(withIdentifier: "AllGroupCell") as! AllGroupsCell
        
        let index = indexPath.row
        let title = localData[index].title
        let avatar = localData[index].avatar
        
        cell.setData(title: title, avatar: avatar)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

        let addAction = UIContextualAction(style: .normal, title: "Add") {(action, view, completion) in
            let index = allGroupData.firstIndex(where: {$0.id == self.localData[indexPath.row].id})
            groupData.append(allGroupData[index!])
            
            allGroupData.remove(at: index!)
            
            self.localData.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    
        addAction.backgroundColor = .systemBlue
        
        return UISwipeActionsConfiguration(actions: [addAction])
    }
}
