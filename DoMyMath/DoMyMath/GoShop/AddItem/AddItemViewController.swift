//
//  AddItemViewController.swift
//  DoMyMath
//
//  Created by Vitor Gomes on 25/01/21.
//

import UIKit

class AddItemViewController: UIViewController {

   
    var controller: AddItemController = AddItemController()
    
    //MARK:- Outlets
    
    @IBOutlet weak var addLabel: UILabel!
    @IBOutlet weak var insertView: UIView!
    @IBOutlet weak var itemTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var quantTextField: UITextField!
    @IBOutlet weak var addButton: UIButton!
    
    var editMode = false
    
    var item: ListItem?
    
    //MARK:- viewDidLoad

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.setupTextField()
        self.setupButton()
        
        if editMode {
            addLabel.text = "Edite o seu item"
            addButton.setTitle("Editar Item", for: .normal)
        }
        
        if let item = item {
            itemTextField.text = item.product
            priceTextField.text = item.price.description
            quantTextField.text = item.quantity.description
        }

    }
    
    // actions
    
    @IBAction func addAction(_ sender: Any) {
        
        guard let prod = self.itemTextField.text,
              let quantity =  Int(self.quantTextField.text ?? ""),
              let price = Float(self.priceTextField.text ?? "") else { return }
        
        if editMode {
            self.item?.product = prod
            self.item?.price = price
            self.item?.quantity = quantity
            
            if let item = item {
                
                self.controller.editItem(editItem: item)
            }
            
        } else {
            
            self.controller.addItem(produto: prod,
                                    quantidade: quantity,
                                    preco: price)
            
            self.clearFields()
        }
        
        self.dismiss(animated: true, completion: nil)
       
    }
    
    //  Functions
    
    func setupButton() {
        
        self.insertView.layer.cornerRadius = 10
        self.insertView.layer.borderWidth = 2
        self.addButton.layer.cornerRadius = 10
        self.addButton.layer.borderWidth = 2
    }
    
    
    func setupTextField(){
        
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




