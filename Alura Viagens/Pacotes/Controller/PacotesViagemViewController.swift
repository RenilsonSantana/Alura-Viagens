//
//  PacotesViagemViewController.swift
//  Alura Viagens
//
//  Created by Renilson Santana on 12/04/21.
//

import UIKit

class PacotesViagemViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let listaViagens: Array<Viagem> = ViagemDAO().retornaTodasAsViagens()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.listaViagens.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celula = collectionView.dequeueReusableCell(withReuseIdentifier: "celulaPacotes", for: indexPath) as! PacotesViagemCollectionViewCell
        
        let viagem = listaViagens[indexPath.row]
        
        celula.imagemViagem.image = UIImage(named: viagem.caminhoDaImagem)
        celula.labelTitulo.text = viagem.titulo
        celula.labelQuantidadeDias.text = "\(viagem.quantidadeDeDias) dias"
        celula.labelPreco.text = "R$ \(viagem.preco)"
        
        celula.layer.borderWidth = 0.5
        celula.layer.borderColor = UIColor(red: 85.0/225.0, green: 85.0/225.0, blue: 85.0/225.0, alpha: 1).cgColor
        celula.layer.cornerRadius = 10
        
        return celula
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width / 2 - 10, height: 160)
    }

}
