//
//  ViewController.swift
//  CandySearch
//
//  Created by 아우신얀 on 2023/09/30.
//

import UIKit

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   

    @IBOutlet weak var tableView: UITableView!
    
    var candyList = [Candy]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initList()
    }
    
    func initList() {
        let ChocolateBar = Candy(id: "0", name: "Chocolate Bar")
        candyList.append(ChocolateBar)
        
        let ChocolateChip = Candy(id: "1", name: "Chocolate Chip")
        candyList.append(ChocolateChip)
        
        let DarkChocolate = Candy(id: "2", name: "Dark Chocolate")
        candyList.append(DarkChocolate)
        
        let Lollipop = Candy(id: "3", name: "Lollipop")
        candyList.append(Lollipop)
        
        let CandyCane = Candy(id: "4", name: "Candy Cane")
        candyList.append(CandyCane)
        
        let JawBreaker = Candy(id: "5", name: "Jaw Breaker")
        candyList.append(JawBreaker)
        
        let Caramel = Candy(id: "6", name: "Caramel")
        candyList.append(Caramel)
        
        let SourChew = Candy(id: "7", name: "Sour Chew")
        candyList.append(SourChew)
        
        let GummiBear = Candy(id: "8", name: "Gummi Bear")
        candyList.append(GummiBear)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return candyList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "tableViewCellID") as! TableViewCell
        
        let thisCandy = candyList[indexPath.row]
        //tableViewCell.configure(data: thisCandy.id + " " + thisCandy.name )
        tableViewCell.configure(data: thisCandy.name )
        //tableViewCell.text = thisCandy.id + " " + thisCandy.name
        
        return tableViewCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "detailSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "detailSegue") {
            let indexPath = self.tableView.indexPathForSelectedRow!
            
            let tableViewDetail = segue.destination as? TableViewDetail
            
            let selectedCandy = candyList[indexPath.row]
            
            tableViewDetail?.selectedCandy = selectedCandy
            
            self.tableView.deselectRow(at: indexPath, animated: true)
        }
    }


}

