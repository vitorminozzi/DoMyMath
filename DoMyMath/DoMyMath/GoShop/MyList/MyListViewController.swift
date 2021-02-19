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
        if let item = sender as? ListItem {
            vc?.editMode = true
            vc?.item = item
        }
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
            
            controller.myListItens.remove(at: indexPath.row)
            self.quantNumberLabel.text = self.controller.quantity.description
            self.totalPriceLabel.text = self.controller.total.description
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.performSegue(withIdentifier: "AddItemViewController",
                          sender: self.controller.myListItens[indexPath.row])
    }
    
    
}




//  protocol aplicado


extension MyListViewController: AddItemControllerProtocol{
    
    
    func successAddPrice(price: [Float]) {
        
        self.totalPriceLabel.text = String(self.controller.total)
        
    }
    
    
    
    
    func successAddInt(int: [Int]) {
        
        self.quantNumberLabel.text = String(self.controller.quantity)
    
    }
    
    
    func successAddProduto(item: ListItem) {
        
        for (index, itemActual) in self.controller.myListItens.enumerated() {
            if itemActual.id == item.id {
                self.controller.myListItens.remove(at: index)
                self.controller.myListItens.insert(item, at: index)
                self.listTableView.reloadData()
                self.totalPriceLabel.text = self.controller.total.description
                self.quantNumberLabel.text = self.controller.quantity.description
                return
            }
        }
        
        self.controller.myListItens.append(item)
        self.listTableView.reloadData()
        self.totalPriceLabel.text = self.controller.total.description
        self.quantNumberLabel.text = self.controller.quantity.description
        print("to aqui")
        
    }

}
