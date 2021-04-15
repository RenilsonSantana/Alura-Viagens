//
//  TableViewCell.swift
//  Alura Viagens
//
//  Created by Renilson Santana on 10/04/21.
//

import UIKit

class TableViewCell: UITableViewCell{
    
    // MARK: -IBOutlets
    @IBOutlet weak var labelTitulo: UILabel!
    @IBOutlet weak var labelDias: UILabel!
    @IBOutlet weak var labelPreco: UILabel!
    @IBOutlet weak var imagemViagem: UIImageView!
    
    //MARK: - Metodos
    func configuraCelula(viagem: Viagem){
        self.labelTitulo.text = viagem.titulo
        self.labelDias.text = (viagem.quantidadeDeDias == 1) ? "1 dia" : "\(viagem.quantidadeDeDias) dias"
        self.labelPreco.text = viagem.preco
        self.imagemViagem.image = UIImage(named: viagem.caminhoDaImagem)
        
        self.imagemViagem.layer.cornerRadius = 10
        self.imagemViagem.layer.masksToBounds = true
    }
}
