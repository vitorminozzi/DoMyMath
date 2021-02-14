//
//  ListItem.swift
//  DoMyMath
//
//  Created by Vitor Gomes on 01/02/21.
//

import Foundation


struct ListItem: Encodable{
    
    let id = UUID().uuidString
    var quantity:Int
    var product:String
    var price:Float
    var total: Float {
        return price * Float(quantity)
    }
    
}
    
