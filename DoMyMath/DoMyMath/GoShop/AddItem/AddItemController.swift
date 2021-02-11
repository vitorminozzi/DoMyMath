//
//  AddItemController.swift
//  DoMyMath
//
//  Created by Vitor Gomes on 01/02/21.
//

import Foundation

protocol AddItemControllerProtocol: class  {
    
    func successAddProduto(array: [ListItem])
    func successAddInt(int: [Int])
    func successAddPrice(price: [Float])
    
    
}

class AddItemController {
    
    var listItem:[ListItem] = []
    var quantNumbers:[Int] = []
    var price:[Float] = []
    
    weak var delegate:AddItemControllerProtocol?
    
  
    func addItem(produto: String?, quantidade: String?, preco: String?) {
        
        let model: ListItem = ListItem(quantity: Int(quantidade ?? "0"), product: produto, price: Float(preco ?? "0"))
        
        self.listItem.append(model)
        self.price.append(self.configurePrice(quantity: model.quantity ?? 0, price: model.price ?? 0.0))
        self.quantNumbers.append(model.quantity ?? 0)
        
        self.successAddItem()
      
        
    }
    
    private func successAddItem() {
        
        self.delegate?.successAddInt(int:self.quantNumbers)
        self.delegate?.successAddProduto(array: self.listItem)
        self.delegate?.successAddPrice(price: self.price)
        
    }
    
    
    func configurePrice(quantity:Int, price:Float) -> Float{
        
        let multiplier = quantity
        let realPrice = price
        
        let realFloat = Float(multiplier) * realPrice
        
        return realFloat
        
    }
    
    
    
   
    
    

    
}
    
    

