//
//  AddItemController.swift
//  DoMyMath
//
//  Created by Vitor Gomes on 01/02/21.
//

import Foundation



class AddItemController {
    
    var item:[ListItem]?
     
     let userDefauts = UserDefaults()
     
     
    
    
     func addItemToDefauts(quantity:Int, product:String, price:Float){

        
        
        
         let defauts = UserDefaults.standard
         let encoded = JSONEncoder()

         self.item?.append(ListItem(quantity: quantity, product: product, price: price))
      
        
         if let item = self.item{
             
             if let encoded = try? encoded.encode(item){

                 defauts.setValue(encoded, forKey: "item")
                 
             }
         }
         
     }
    
    
    


        
    func getDecodedItems() -> [ListItem] {
                
                var listItem:[ListItem] = []
                let defaults = UserDefaults.standard
                let decoder = JSONDecoder()
            
            if let _decodeItem = defaults.object(forKey: "item") as? Data {
                    
                    if let loadItem = try? decoder.decode([ListItem].self, from: _decodeItem){
                        
                        
                    listItem = loadItem
                   
                      
                    }
                }
        
        return listItem
    }

    
    
}
    
    

