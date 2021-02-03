//
//  ListTableViewCell.swift
//  DoMyMath
//
//  Created by Vitor Gomes on 01/02/21.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    
    @IBOutlet weak var quantLabel: UILabel!
    @IBOutlet weak var produtoLabel: UILabel!
    @IBOutlet weak var cifraoLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
}
