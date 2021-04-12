//
//  ViewController.swift
//  Alura Viagens
//
//  Created by Renilson Santana on 09/04/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableViewViagens: UITableView!
    @IBOutlet weak var viewHoteis: UIView!
    @IBOutlet weak var viewPacotes: UIView!
    
    let listaViagens: Array<Viagem> = ViagemDAO().retornaTodasAsViagens()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewViagens.dataSource = self
        tableViewViagens.delegate = self
        tableViewViagens.reloadData()
        viewPacotes.layer.cornerRadius = 10
        viewHoteis.layer.cornerRadius = 10
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaViagens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        let viagemAtual = listaViagens[indexPath.row]
        
        celula.labelTitulo.text = viagemAtual.titulo
        celula.labelDias.text = "\(viagemAtual.quantidadeDeDias) dias"
        celula.labelPreco.text = viagemAtual.preco
        celula.imagemViagem.image = UIImage(named: viagemAtual.caminhoDaImagem)
        
        celula.imagemViagem.layer.cornerRadius = 10
        celula.imagemViagem.layer.masksToBounds = true
        
        return celula
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone ? 175 : 260
    }
    
}

