//
//  EditListView.swift
//  DoMyMath
//
//  Created by Vitor Gomes on 12/02/21.
//

import UIKit

class EditListView: UIView {

  
    @IBOutlet weak var editView: UIView!
    
    @IBOutlet weak var editLabel: UILabel!
    @IBOutlet weak var editItemTextField: UITextField!
    @IBOutlet weak var editPriceTextField: UITextField!
    @IBOutlet weak var editQuantTextField: UITextField!
    @IBOutlet weak var editButton: UIButton!
    
    
    
    override init(frame: CGRect){
        
        super.init(frame: frame)
        
    }
     
    required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
    
    }
    
    
    
    @IBAction func editAction(_ sender: Any) {
        
    
    }
    
    
    
    func setupEditButton(){
        
        
        self.editButton.layer.borderWidth = 1
        self.editButton.layer.cornerRadius = 10
        self.editButton.layer.borderColor = CGColor(red: 245, green: 149, blue: 106, alpha: 1.0)
    
    }
    
    
    
}

