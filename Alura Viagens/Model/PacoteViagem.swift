//
//  PacoteViagem.swift
//  Alura Viagens
//
//  Created by Renilson Santana on 14/04/21.
//

import Foundation

class PacoteViagem{
    
    // MARK: - atributos
    let nomeDoHotel: String
    let descricao: String
    let dataViagem: String
    let viagem: Viagem
    
    // MARK: Init
    init(nomeDoHotel: String, descricao: String, dataViagem: String, viagem: Viagem){
        self.nomeDoHotel = nomeDoHotel
        self.descricao = descricao
        self.dataViagem = dataViagem
        self.viagem = viagem
    }
}
