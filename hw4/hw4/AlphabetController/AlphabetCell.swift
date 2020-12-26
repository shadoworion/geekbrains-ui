//
//  AlphabetCell.swift
//  hw4
//
//  Created by David Dakhovich on 19/12/2020.
//

import UIKit

class AlphabetCell: UITableViewCell {

    @IBOutlet weak var fullnameLabel: UILabel!
    
    func setData(fullname: String){
        fullnameLabel.text = fullname
    }

}
