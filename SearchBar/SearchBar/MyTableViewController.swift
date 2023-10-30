//
//  MyTableViewController.swift
//  SearchBar
//
//  Created by 아우신얀 on 2023/09/30.
//

import UIKit

class MyTableViewController: UITableViewController, UISearchBarDelegate{
    
    let data = ["Chocolate Bar",
                "Chocolate Chip",
                "Dark Chocolate",
                "Lollipop",
                "Candy Cane",
                "Jaw Breaker",
                "Caramel",
                "Sour Chew",
                "Gummi Bear"]
    
    var filteredData: [String]!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        
        filteredData = data

    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return filteredData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {//셀이 뭘 보여주고 싶은지
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")! as UITableViewCell
        cell.textLabel?.text = filteredData[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt: IndexPath) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "LabelVC") else { return }
       
        self.navigationController?.pushViewController(vc, animated: false)
    }

        
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredData = []
        
        if searchText == "" {
            filteredData = data
        } else {
            for candy in data {
                if candy.lowercased().contains(searchText.lowercased()) { //내림차순
                    
                    filteredData.append(candy)
                }
            }
        }
        self.tableView.reloadData() //새로고침
    }
}
   
