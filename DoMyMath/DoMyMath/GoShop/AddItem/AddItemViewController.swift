//
//  AddItemViewController.swift
//  DoMyMath
//
//  Created by Vitor Gomes on 25/01/21.
//

import UIKit

class AddItemViewController: UIViewController {

    @IBOutlet weak var addLabel: UILabel!
    
    @IBOutlet weak var insertView: UIView!
    
    @IBOutlet weak var itemTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var quantTextField: UITextField!
    
    @IBOutlet weak var addButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.setupButton()
        
      
    }
    
    
    
    @IBAction func addAction(_ sender: Any) {
        
        
        print(self.itemTextField.text ?? "")
        print(self.priceTextField.text ?? "")
        print(self.quantTextField.text ?? "")
        self.itemTextField.text = nil
        self.priceTextField.text = nil
        self.quantTextField.text = nil
    }
    
    
    
    func setupButton() {
        
        self.insertView.layer.cornerRadius = 10
        self.insertView.layer.borderWidth = 2
        self.addButton.layer.cornerRadius = 10
        self.addButton.layer.borderWidth = 2
        
        
    }
    

}
