//
//  ViewController.swift
//  Alura Viagens
//
//  Created by Renilson Santana on 09/04/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - atributos
    let listaViagens: Array<Viagem> = ViagemDAO().retornaTodasAsViagens()
    
    // MARK: - IBOutlets
    @IBOutlet weak var tableViewViagens: UITableView!
    @IBOutlet weak var viewHoteis: UIView!
    @IBOutlet weak var viewPacotes: UIView!
    
    // MARK: life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewViagens.dataSource = self
        tableViewViagens.delegate = self
        tableViewViagens.reloadData()
        viewPacotes.layer.cornerRadius = 10
        viewHoteis.layer.cornerRadius = 10
        
    }

    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaViagens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        let viagemAtual = listaViagens[indexPath.row]
            
        celula.configuraCelula(viagem: viagemAtual)
        
        return celula
    }
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone ? 175 : 260
    }
    
}

