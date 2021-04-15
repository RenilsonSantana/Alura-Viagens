//
//  PacotesViagemCollectionViewCell.swift
//  Alura Viagens
//
//  Created by Renilson Santana on 12/04/21.
//

import UIKit

class PacotesViagemCollectionViewCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var imagemViagem: UIImageView!
    @IBOutlet weak var labelTitulo: UILabel!
    @IBOutlet weak var labelQuantidadeDias: UILabel!
    @IBOutlet weak var labelPreco: UILabel!
    
    // MARK: - Metodos
    func configuraCelula(pacoteViagem: PacoteViagem){
        self.imagemViagem.image = UIImage(named: pacoteViagem.viagem.caminhoDaImagem)
        self.labelTitulo.text = pacoteViagem.viagem.titulo
        self.labelQuantidadeDias.text = "\(pacoteViagem.viagem.quantidadeDeDias) dias"
        self.labelPreco.text = "R$ \(pacoteViagem.viagem.preco)"
        
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor(red: 85.0/225.0, green: 85.0/225.0, blue: 85.0/225.0, alpha: 1).cgColor
        self.layer.cornerRadius = 10
    }
}
