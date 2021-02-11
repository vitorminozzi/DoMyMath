//
//  MyListController.swift
//  DoMyMath
//
//  Created by Vitor Gomes on 02/02/21.
//

import Foundation



class MyListController {
    
    
    var myListItens:[ListItem] = []
    var quantityArray:[Int] = []
    var priceArray:[Float] = []

    
    
    func getReducePrice() -> Float{
        
       let price = self.priceArray.reduce(0, +)
       return price
    }
    
    
    func getReduceQuantity() -> Int{
        
        let quantity = self.quantityArray.reduce(0, +)
        return quantity
        
    }
    
    
}
