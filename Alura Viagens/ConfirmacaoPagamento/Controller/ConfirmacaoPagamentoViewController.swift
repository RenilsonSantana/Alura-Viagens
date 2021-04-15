//
//  ConfirmacaoPagamentoViewController.swift
//  Alura Viagens
//
//  Created by Renilson Santana on 15/04/21.
//

import UIKit

class ConfirmacaoPagamentoViewController: UIViewController {
    
    // MARK: - atributos
    var pacoteSelecionado: PacoteViagem? = nil
    
    // MARK: - IBOutlets
    @IBOutlet weak var imagemPacote: UIImageView!
    @IBOutlet weak var labelTitulo: UILabel!
    @IBOutlet weak var labelNomeDoHotel: UILabel!
    @IBOutlet weak var labelData: UILabel!
    @IBOutlet weak var labelDescricao: UILabel!
    @IBOutlet weak var botaoVoltarHome: UIButton!
    
    
    // MARK: - IBActions
    @IBAction func botaoVoltarHome(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    // MARK: - life cycle
    override func viewDidLoad() {
        
        if let pacote = pacoteSelecionado {
            self.imagemPacote.image = UIImage(named: pacote.viagem.caminhoDaImagem)
            self.labelTitulo.text = pacote.viagem.titulo.uppercased()
            self.labelNomeDoHotel.text = pacote.nomeDoHotel
            self.labelData.text = pacote.dataViagem
            self.labelDescricao.text = pacote.descricao
            
            self.imagemPacote.layer.cornerRadius = 10
            self.imagemPacote.layer.masksToBounds = true
            
            self.botaoVoltarHome.layer.cornerRadius = 10
        }
        
        super.viewDidLoad()
    }

}
