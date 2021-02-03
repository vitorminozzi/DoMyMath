//
//  MyListViewController.swift
//  DoMyMath
//
//  Created by Vitor Gomes on 26/01/21.
//

import UIKit

class MyListViewController: UIViewController {
    
       
    
    

    @IBOutlet weak var listTableView: UITableView!
    
    @IBOutlet weak var quantLabel: UILabel!
    @IBOutlet weak var quantNumberLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var totalPriceLabel: UILabel!
    
    @IBOutlet weak var helpButton: UIButton!
    @IBOutlet weak var backToAddButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        self.listTableView.register(UINib(nibName: "ListTableViewCell", bundle: nil), forCellReuseIdentifier: "ListTableViewCell")
        self.listTableView.delegate = self
        self.listTableView.dataSource = self
        
        
        
        self.setupLabels()
        
        
     
    }
    

    func setupLabels(){
        
        self.quantNumberLabel.layer.borderWidth = 1
        self.quantNumberLabel.layer.cornerRadius = 10
        self.totalPriceLabel.layer.borderWidth = 1
        self.totalPriceLabel.layer.cornerRadius = 10
        
        
        
    }


}


extension MyListViewController: UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:ListTableViewCell? = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCell") as? ListTableViewCell
        
        
        return cell ?? UITableViewCell()
        
        
    }
    
    
    
    
}
