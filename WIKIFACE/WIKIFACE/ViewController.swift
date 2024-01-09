//
//  ViewController.swift
//  WIKIFACE
//
//  Created by 아우신얀 on 1/4/24.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    var dog: UIImage?
    var karina: UIImage?
    var Lany: UIImage?
    var maru: UIImage?
    var oasis: UIImage?
    var yerinbaek: UIImage?
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self
        
        dog = UIImage(named:"dog")
        karina = UIImage(named: "karina")
        Lany = UIImage(named: "Lany")
        maru = UIImage(named: "maru")
        oasis = UIImage(named: "oasis")
        yerinbaek = UIImage(named: "yerinbaek")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let searchText = textField.text{
            
            if searchText == "dog" {
                imageView.image = dog
            }
            else if searchText == "karina" {
                imageView.image = karina
            }
            else if searchText == "Lany" {
                imageView.image = Lany
            }
            else if searchText == "maru" {
                imageView.image = maru
            }
            else if searchText == "oasis" {
                imageView.image = oasis
            }
            else if searchText == "yerinbaek" {
                imageView.image = yerinbaek
            }
        }
        
        
        textField.resignFirstResponder()
        
        return true
    }
    
}
