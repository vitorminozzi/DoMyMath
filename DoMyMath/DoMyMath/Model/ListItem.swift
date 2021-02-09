//
//  ListItem.swift
//  DoMyMath
//
//  Created by Vitor Gomes on 01/02/21.
//

import Foundation


class ListItem: Encodable, Decodable{
    
 
    var quantity:Int?
    var product:String?
    var price:Float?
    
    
    init(quantity:Int, product:String, price:Float) {
        
        self.quantity = quantity
        self.product = product
        self.price = price
        
    }
    
}
    
