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
    
    
   
    var myListItens:[ListItem] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.listTableView.register(UINib(nibName: "ListTableViewCell", bundle: nil), forCellReuseIdentifier: "ListTableViewCell")
        self.listTableView.delegate = self
        self.listTableView.dataSource = self
    
        self.setupLabels()
       
    }
    
    @IBAction func helpAction(_ sender: Any) {
        
    
    }
    
    @IBAction func plusAction(_ sender: Any) {
        self.performSegue(withIdentifier: "AddItemViewController", sender: nil)
        
    }
    
    func setupLabels(){
        
        self.quantNumberLabel.layer.borderWidth = 1
        self.quantNumberLabel.layer.cornerRadius = 10
        self.totalPriceLabel.layer.borderWidth = 1
        self.totalPriceLabel.layer.cornerRadius = 10
        
    }
    
    
    func getItem(){
        
        self.listTableView.reloadData()
     
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        let vc: AddItemViewController? = segue.destination as? AddItemViewController
        
        vc?.delegate = self

    }
}


extension MyListViewController: UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.myListItens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:ListTableViewCell? = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCell") as? ListTableViewCell
        
        cell?.setup(item: self.myListItens[indexPath.row])
        
        return cell ?? UITableViewCell()
    }
    
}


extension MyListViewController: AddItemProtocol{
    
    
    func successAddProduto(array: [ListItem]) {
        
        self.myListItens += array
        self.listTableView.reloadData()
        print("to aqui")
        
    }

}
