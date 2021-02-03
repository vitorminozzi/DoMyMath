//
//  AddItemViewController.swift
//  DoMyMath
//
//  Created by Vitor Gomes on 25/01/21.
//

import UIKit

class AddItemViewController: UIViewController {

    
    var controller:AddItemController = AddItemController()
    
    // Outlets
     
    
    
    
    @IBOutlet weak var addLabel: UILabel!
    
    @IBOutlet weak var insertView: UIView!
    
    @IBOutlet weak var itemTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var quantTextField: UITextField!
    
    @IBOutlet weak var addButton: UIButton!
    
    
    
    // viewDidLoad
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        
        self.signDelegate()
        self.setupButton()
        
      
    }
    
    // actions
    
    @IBAction func addAction(_ sender: Any) {
        
        self.addButtonTest()
        controller.addItem(quantity: Int(self.quantTextField.text ?? "") ?? 0, product: self.itemTextField.text ?? "", price: Float(self.priceTextField.text ?? "") ?? 0.1)
        self.clearFields()
    }
    
    //  Functions
    
    
    func setupButton() {
        
        self.insertView.layer.cornerRadius = 10
        self.insertView.layer.borderWidth = 2
        self.addButton.layer.cornerRadius = 10
        self.addButton.layer.borderWidth = 2
    }
    
    
    func addButtonTest(){
        
        print(self.itemTextField.text ?? "")
        print(self.priceTextField.text ?? "")
        print(self.quantTextField.text ?? "")
     
    }
    
    func signDelegate(){
        
        self.itemTextField.delegate = self
        self.priceTextField.delegate = self
        self.quantTextField.delegate = self
    }
    
    func clearFields(){
    
    self.itemTextField.text = nil
    self.priceTextField.text = nil
    self.quantTextField.text = nil
    }
    
    
}






extension AddItemViewController:UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        
        switch textField{
        
        case itemTextField:
            self.priceTextField.becomeFirstResponder()
        case priceTextField:
            self.quantTextField.becomeFirstResponder()
        case quantTextField:
            self.quantTextField.resignFirstResponder()
            
        default:
            self.itemTextField.becomeFirstResponder()
        }
        
        return true
        
    }
    
    
}
