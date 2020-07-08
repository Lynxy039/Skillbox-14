//
//  CD_ToDoTableViewCell.swift
//  Skillbox-14
//
//  Created by Антон Тимоненков on 09.07.2020.
//  Copyright © 2020 Антон Тимоненков. All rights reserved.
//

import UIKit

class CD_ToDoTableViewCell: UITableViewCell {

   @IBOutlet weak var taskView: UIView!
    @IBOutlet weak var textLable: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.accessoryType = selected ? .checkmark : .none
    }
}
