//
//  TableViewDetail.swift
//  CandySearch
//
//  Created by 아우신얀 on 2023/09/30.
//

import Foundation
import UIKit

class TableViewDetail: UIViewController {
    @IBOutlet weak var name: UILabel!
    
    var selectedCandy : Candy!
        override func viewDidLoad() {
        super.viewDidLoad()
        
            name.text = selectedCandy.name
        
    }
}
