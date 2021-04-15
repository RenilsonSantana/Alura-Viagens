//
//  PacotesViagemViewController.swift
//  Alura Viagens
//
//  Created by Renilson Santana on 12/04/21.
//

import UIKit

class PacotesViagemViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate, UICollectionViewDelegate {
    
    // MARK: - atributos
    let listaComTodasViagens: Array<PacoteViagem> = PacoteViagemDAO().retornaTodasAsViagens()
    var listaViagens: Array<PacoteViagem> = []
    
    // MARK: - IBOutlets
    @IBOutlet weak var labelContadorDePacotes: UILabel!
    @IBOutlet weak var pesquisarViagem: UISearchBar!
    @IBOutlet weak var colecaoPacotesViagem: UICollectionView!
    
    // MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        listaViagens = listaComTodasViagens
        labelContadorDePacotes.text = atualizaContadorLabel()
    }
    
    // MARK: - UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.listaViagens.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celula = collectionView.dequeueReusableCell(withReuseIdentifier: "celulaPacotes", for: indexPath) as! PacotesViagemCollectionViewCell
        
        let pacote = listaViagens[indexPath.row]
        
        celula.configuraCelula(pacoteViagem: pacote)
        
        return celula
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return (UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone) ? CGSize(width: collectionView.bounds.width / 2 - 10, height: 160) : CGSize(width: collectionView.bounds.width / 3 - 20, height: 250)
    }
    
    
    // MARK: - UISearchBarDelegate
    //Metodo execultado enquanto usuario digita
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        listaViagens = listaComTodasViagens
        
        if(searchText != ""){
            //filtra a lista que contem o que foi digitado pelo atributo titulo
            let listaFiltrada = listaViagens.filter{
                $0.viagem.titulo.contains(searchText)
            }
            listaViagens = listaFiltrada
        }
        colecaoPacotesViagem.reloadData()
        labelContadorDePacotes.text = atualizaContadorLabel()
    }
    
    // MARK: - UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let pacote = listaViagens[indexPath.row]
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controllerDetalhe = storyboard.instantiateViewController(identifier: "detalhe") as! DetalheViagemViewController
        
        controllerDetalhe.pacoteSelecionado = pacote
        
        //present(controllerDetalhe, animated: true, completion: nil)
        
        self.navigationController?.pushViewController(controllerDetalhe, animated: true)
    }
    
    // MARK: - Metodos
    func atualizaContadorLabel() -> String{
        return (listaViagens.count == 1) ? "1 pacote encontrado" : "\(listaViagens.count) pacotes encontrados"
    }
}
