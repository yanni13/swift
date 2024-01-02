//
//  TableViewController.swift
//  ToDoList
//
//  Created by 아우신얀 on 12/21/23.
//

import UIKit

class TableViewController: UITableViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source
    
    //셀 반환 값
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
    
    @objc func showAlert(_ sender: Any) {
        
        let alert = UIAlertController(title: "New Resoultion", message: nil, preferredStyle: .alert)
        alert.addTextField()
        
        let submitAction = UIAlertAction(title: "confirm", style: .default) { [unowned alert] _ in
            let answer1 = alert.textFields![0]
        }
        
        let cancel = UIAlertAction(title: "cancel", style: .cancel) { [unowned alert] _ in
            let answer2 = alert.textFields![1]
        }
        alert.addAction(submitAction)
        alert.addAction(cancel)
        
        present(alert, animated: true, completion: nil)
    }
}
    
