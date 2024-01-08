//
//  ViewController.swift
//  NewYear
//
//  Created by 아우신얀 on 1/2/24.
//

import UIKit

class ViewController: UIViewController {
    
    
    let addBtn : UIButton = {
        let button = UIButton()
        
        button.setTitle("+", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 30)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        self.view.addSubview(addBtn)
        
        let safeArea = self.view.safeAreaLayoutGuide
        
        self.addBtn.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 100).isActive = true
        
        addBtn.addTarget(self, action: #selector(Alert), for: .touchUpInside)
        
    }
    
    
    
    @objc private func Alert() {
        let alert = UIAlertController(title: "New Resoultion", message: "", preferredStyle: .alert)
        alert.addTextField { textField in
            textField.placeholder = "Type smothing..."}
        
        let cancel = UIAlertAction(title: "cancel", style: .default, handler: nil)
        let confirm = UIAlertAction(title: "confirm", style: .default) {_ in
            //확인 눌렀을 때 데이터가 저장되야함
            
        }
        
        alert.addAction(cancel)
        alert.addAction(confirm)
        
        present(alert, animated: true, completion: nil)
    }
    
  

    
}

