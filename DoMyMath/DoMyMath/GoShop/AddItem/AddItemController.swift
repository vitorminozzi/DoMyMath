//
//  AddItemController.swift
//  DoMyMath
//
//  Created by Vitor Gomes on 01/02/21.
//

import Foundation

protocol AddItemControllerProtocol: class  {
    
    func successAddProduto(item: ListItem)
    func successAddInt(int: [Int])
    func successAddPrice(price: [Float])
    
}

class AddItemController {
    
    var listItem: ListItem?
    var quantNumbers:[Int] = []
    var price:[Float] = []
    
    weak var delegate:AddItemControllerProtocol?

    func addItem(produto: String, quantidade: Int = 0, preco: Float = 0.0) {
        
        let model: ListItem = ListItem(quantity: quantidade, product: produto, price: preco)
        
        self.listItem = model
        self.price.append(self.configurePrice(quantity: model.quantity, price: model.price))
        self.quantNumbers.append(model.quantity)
        
        self.successAddItem()
      
        
    }
    
    func editItem(editItem: ListItem) {
        
        self.listItem = editItem
        successAddItem()
    }
    
    private func successAddItem() {
        
        self.delegate?.successAddInt(int:self.quantNumbers)
        if let item = listItem {
            self.delegate?.successAddProduto(item: item)
        }
        
        self.delegate?.successAddPrice(price: self.price)
        
    }
    
    
    func configurePrice(quantity:Int, price:Float) -> Float{
        
        let multiplier = quantity
        let realPrice = price
        
        let realFloat = Float(multiplier) * realPrice
        
        return realFloat
        
    }
}
