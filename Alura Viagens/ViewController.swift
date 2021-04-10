//
//  ViewController.swift
//  Alura Viagens
//
//  Created by Renilson Santana on 09/04/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableViewViagens: UITableView!
    let listaViagens: Array<String> = ["Rio de Janeiro", "Ceará", "Sao Paulo"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewViagens.reloadData()
        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaViagens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        celula.textLabel?.text = listaViagens[indexPath.row]
        
        return celula
    }
    
}

