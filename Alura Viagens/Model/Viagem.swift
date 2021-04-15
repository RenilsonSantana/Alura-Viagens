//
//  Viagem.swift
//  Alura Viagens
//
//  Created by Renilson Santana on 10/04/21.
//

import Foundation

class Viagem{
    
    // MARK: - atributos
    let titulo: String
    let quantidadeDeDias: Int
    let preco: String
    let caminhoDaImagem: String
    
    // MARK: - Init
    init(titulo: String, quantidadeDeDias: Int, preco: String, caminhoDaImagem: String) {
        self.titulo = titulo
        self.quantidadeDeDias = quantidadeDeDias
        self.preco = preco
        self.caminhoDaImagem = caminhoDaImagem
    }
}
