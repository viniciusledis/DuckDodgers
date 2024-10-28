//
//  NaveModel.swift
//  DuckDodgers
//
//  Created by Vinicius Ledis on 18/10/2024.
//

import Foundation

struct Nave: Identifiable, Codable {
    enum Tamanho: String, CaseIterable, Codable {
    case pequena, media, grande, colossal
    }
    
    enum Cor: String, CaseIterable, Codable {
    case vermelha, laranja, amarela, verde, azul, anil, violeta
    }
    
    enum Saude: String, CaseIterable, Codable {
    case saudavel, levementeFerido = "Levemente Ferido", gravementeFerido = "Gravemente Ferido" , morto
    }
    
    enum GrauDeAvaria: String, CaseIterable, Codable {
    case perdaTotal = "Perda Total", muitoDestruida = "Muito Destruida", parcialmenteDestruida = "Parcialmente Destruida", praticamenteIntacta = "Praticamente Intacta", semAvarias = "Sem Avarias"
    }
    
    
    let id: UUID
    var tamanho: Tamanho
    var cor: Cor
    var localDaQueda: String
    var armamentos: String?
    var combustivel: String
    var potencialDeProspeccaoTecnologica: Int
    var grauDePericulosidade: Int
    var grauDeAvaria: GrauDeAvaria
    var quantidadeDeTripulantes: Int
    var estadoDosTripulantes: Saude
    var classificacao: String = ""
    
    init(id: UUID = UUID(), tamanho: Tamanho, cor: Cor, localDaQueda: String, armamentos: String? = nil, combustivel: String, potencialDeProspeccaoTecnologica: Int, grauDePericulosidade: Int, grauDeAvaria: GrauDeAvaria, quantidadeDeTripulantes: Int, estadoDosTripulantes: Saude) {
        self.id = id
        self.tamanho = tamanho
        self.cor = cor
        self.localDaQueda = localDaQueda
        self.armamentos = armamentos
        self.combustivel = combustivel
        self.potencialDeProspeccaoTecnologica = potencialDeProspeccaoTecnologica
        self.grauDePericulosidade = grauDePericulosidade
        self.grauDeAvaria = grauDeAvaria
        self.quantidadeDeTripulantes = quantidadeDeTripulantes
        self.estadoDosTripulantes = estadoDosTripulantes
    }
    
}
