//
//  AddItemViewController.swift
//  DoMyMath
//
//  Created by Vitor Gomes on 25/01/21.
//

import UIKit

class AddItemViewController: UIViewController {

    
    
    var addItem:[ListItem] = []
    weak var delegate:AddItemProtocol?
    
    //MARK:- Outlets
    
    @IBOutlet weak var addLabel: UILabel!
    @IBOutlet weak var insertView: UIView!
    @IBOutlet weak var itemTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var quantTextField: UITextField!
    @IBOutlet weak var addButton: UIButton!
    

    //MARK:- viewDidLoad

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.setupTextField()
        self.setupButton()

    }
    
    // actions
    
    @IBAction func addAction(_ sender: Any) {
        
        
        self.addItem.append(ListItem(quantity: Int(self.quantTextField.text ?? "") ?? 0,
                                     product: self.itemTextField.text ?? "",
                                     price: Float(self.priceTextField.text ?? "") ?? 0.0))
        
        print(addItem)
        
        self.delegate?.successAddProduto(array: addItem)
        self.dismiss(animated: true, completion: nil)
        self.clearFields()
       
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




