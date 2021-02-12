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
    @IBOutlet weak var enviarButton: UIButton!
    @IBOutlet weak var backToAddButton: UIButton!
    @IBOutlet weak var finalizarButton: UIButton!
    
    
    var controller:MyListController = MyListController()
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.listTableView.register(UINib(nibName: "ListTableViewCell", bundle: nil), forCellReuseIdentifier: "ListTableViewCell")
        self.listTableView.delegate = self
        self.listTableView.dataSource = self
    
        self.setupLabels()
       
    }
    
    
    
    @IBAction func finalizarAction(_ sender: Any) {
        
    }
    
    
    
    
    @IBAction func sendAction(_ sender: Any) {
        
    
    }
    
    @IBAction func plusAction(_ sender: Any) {
        self.performSegue(withIdentifier: "AddItemViewController", sender: nil)
        
    }
    
    func setupLabels(){
        
        self.quantNumberLabel.layer.borderWidth = 1
        self.quantNumberLabel.layer.cornerRadius = 10
        self.totalPriceLabel.layer.borderWidth = 1
        self.totalPriceLabel.layer.cornerRadius = 10
        self.finalizarButton.layer.cornerRadius = 10
        
        
    }
    
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let vc: AddItemViewController? = segue.destination as? AddItemViewController
        
        vc?.controller.delegate = self

    }
}


extension MyListViewController: UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.controller.myListItens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:ListTableViewCell? = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCell") as? ListTableViewCell
        
        cell?.setup(item: self.controller.myListItens[indexPath.row])
        
        return cell ?? UITableViewCell()
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCell.EditingStyle.delete {
            
            controller.quantityArray.remove(at: indexPath.row)
            self.quantNumberLabel.text = "\(self.controller.getReduceQuantity())"
            
            controller.priceArray.remove(at: indexPath.row)
            self.totalPriceLabel.text = "\(self.controller.getReducePrice())"
            
        
            controller.myListItens.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
            }
        
        
       
        
        
    }
    
    
    
}




//  protocol aplicado


extension MyListViewController: AddItemControllerProtocol{
    
    
    func successAddPrice(price: [Float]) {
        

        self.controller.priceArray += price
        self.totalPriceLabel.text = "\(self.controller.getReducePrice())"
        
    }
    
    
    
    
    func successAddInt(int: [Int]) {
        
       
        self.controller.quantityArray += int
        self.quantNumberLabel.text = "\(self.controller.getReduceQuantity())"
    
    }
    
    
    func successAddProduto(array: [ListItem]) {
        
        self.controller.myListItens += array
        self.listTableView.reloadData()
        print("to aqui")
        
    }

}
