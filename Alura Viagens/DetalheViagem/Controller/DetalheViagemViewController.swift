//
//  DetalheViagemCollectionViewController.swift
//  Alura Viagens
//
//  Created by Renilson Santana on 13/04/21.
//

import UIKit

class DetalheViagemViewController: UIViewController {
    
    // MARK: - Atributos
    var pacoteSelecionado: PacoteViagem? = nil
    
    // MARK: - IBOutlets
    @IBOutlet weak var imagemPacote: UIImageView!
    @IBOutlet weak var labelTitulo: UILabel!
    @IBOutlet weak var labelDescricao: UILabel!
    @IBOutlet weak var labelQuantidadeDeDias: UILabel!
    @IBOutlet weak var labelData: UILabel!
    @IBOutlet weak var labelPreco: UILabel!
    @IBOutlet weak var scrollPrincipal: UIScrollView!
    @IBOutlet weak var textFieldData: UITextField!
    
    // MARK: - IBActions
    @IBAction func botaoVoltar(_ sender: UIButton) {
        //self.dismiss(animated: true, completion: nil)
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func textFieldEntrouFoco(_ sender: UITextField) {
        let datePickerView = UIDatePicker()
        datePickerView.datePickerMode = .date
        sender.inputView = datePickerView
        datePickerView.addTarget(self, action: #selector(exibeDataTextField(sender:)), for: .valueChanged)
    }
    
    @IBAction func botaoFinalizar(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controllerConfirmacao = storyboard.instantiateViewController(identifier: "confirmacao") as! ConfirmacaoPagamentoViewController
        
        controllerConfirmacao.pacoteSelecionado = pacoteSelecionado
        
        //self.present(controllerConfirmacao, animated: true, completion: nil)
        self.navigationController?.pushViewController(controllerConfirmacao, animated: true)
    }
    
    // MARK: - life cycle
    override func viewDidLoad() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(aumentarScroll(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        if let pacote = pacoteSelecionado{
            imagemPacote.image = UIImage(named: pacote.viagem.caminhoDaImagem)
            labelTitulo.text = pacote.viagem.titulo
            labelDescricao.text = pacote.descricao
            labelQuantidadeDeDias.text = "\(pacote.viagem.quantidadeDeDias) dias"
            labelData.text = pacote.dataViagem
            labelPreco.text = pacote.viagem.preco
        }
        
        super.viewDidLoad()
    }
    
    // MARK: Metodos
    @objc func exibeDataTextField(sender: UIDatePicker) {
        let formatador = DateFormatter()
        formatador.dateFormat = "dd/MM/yyyy"
        self.textFieldData.text = formatador.string(from: sender.date)
    }
    
    @objc func aumentarScroll(notification: Notification){
        self.scrollPrincipal.contentSize = CGSize(width: self.scrollPrincipal.frame.width, height: self.scrollPrincipal.frame.height + 320)
    }
    
}
