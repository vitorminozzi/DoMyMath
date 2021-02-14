//
//  MyListController.swift
//  DoMyMath
//
//  Created by Vitor Gomes on 02/02/21.
//

import Foundation



class MyListController {
    
    
    var myListItens:[ListItem] = []
    
    var total: Float {
        var total : Float = 0.0
        
        for item in myListItens {
            total += item.total
        }
        
        return total
    }
    
    var quantity: Int {
        var total : Int = 0
        for item in myListItens {
            total += item.quantity
        }
        
        return total
    }

    
    
//    func getReducePrice() -> Float{
//
//       let price = self.priceArray.reduce(0, +)
//       return price
//    }
//
//
//    func getReduceQuantity() -> Int{
//
//        let quantity = self.quantityArray.reduce(0, +)
//        return quantity
//
//    }
    
    
}
