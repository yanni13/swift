//
//  TableViewCell.swift
//  CandySearch
//
//  Created by 아우신얀 on 2023/09/30.
//

import Foundation
import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var searchWord: UILabel!
    
    func configure(data: String){
        searchWord.text = data
    }
}
