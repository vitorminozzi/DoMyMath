//
//  AddItemController.swift
//  DoMyMath
//
//  Created by Vitor Gomes on 01/02/21.
//

import Foundation






class AddItemController {
    
    
    var item:[ListItem] = []
    
    
    
    func addItem(quantity:Int, product:String, price:Float){
        
        
        self.item.append(ListItem(quantity: quantity, product: product, price: price))
        print("Produto foi adicionado a item: \(item[item.count - 1].product)")
        
    }
    
    
    
    
}
