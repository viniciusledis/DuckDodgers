//
//  NaveViewModel.swift
//  DuckDodgers
//
//  Created by Vinicius Ledis on 18/10/2024.
//

import Foundation
import SwiftUI

@Observable
class NaveViewModel {
    // Armazena uma instância de Nave para uso temporário, além de uma lista para armazenar várias naves
    var nave: Nave
    var naves: [Nave] = []
    
    // Chave para salvar e carregar os dados de naves da persistência local
    private let navesKey = "navesKey"
    
    // Inicializador que cria uma nova nave padrão e carrega as naves salvas, se houver
    init() {
        self.nave = Nave(tamanho: .media, cor: .azul, localDaQueda: "", armamentos: "", combustivel: "", potencialDeProspeccaoTecnologica: 0, grauDePericulosidade: 0, grauDeAvaria: .semAvarias, quantidadeDeTripulantes: 0, estadoDosTripulantes: .saudavel)
        carregarNaves()
    }    
    
    // Classifica a nave com base em suas características e retorna uma String com a categoria
    func classificarNave(nave: Nave) -> String {
        if nave.grauDeAvaria == .perdaTotal || nave.grauDeAvaria == .muitoDestruida {
            return "Sucata Espacial"
        } else if nave.potencialDeProspeccaoTecnologica > 70 {
            return "Joia Tecnológica"
        } else if let armamento = nave.armamentos, !armamento.isEmpty, nave.grauDePericulosidade > 60 {
            return "Arsenal Alienígena"
        } else if nave.grauDePericulosidade > 80 {
            return "Ameaça em Potencial"
        } else if nave.combustivel.contains("Desconhecido") {
            return "Fonte de Energia Alternativa"
        } else if nave.combustivel.contains("Uranio") || nave.combustivel.contains("Exótico"), nave.potencialDeProspeccaoTecnologica > 50 {
            return "Exploradora Espacial"
        } else if nave.quantidadeDeTripulantes > 10, nave.grauDePericulosidade < 30 {
            return "Nave de Transporte de Cargas"
        } else if nave.quantidadeDeTripulantes < 5, nave.potencialDeProspeccaoTecnologica > 70, (nave.armamentos?.isEmpty ?? true) {
            return "Nave Diplomática"
        } else if nave.potencialDeProspeccaoTecnologica > 80, (nave.armamentos?.isEmpty ?? true), nave.estadoDosTripulantes == .saudavel {
            return "Nave Científica"
        } else {
            return "Indefinido"
        }
    }
    
    // Gera um relatório da nave: classifica, armazena na lista e salva no dispositivo
    func gerarRelatorio(nave: Nave) {
        let classificacao = classificarNave(nave: nave)
        var naveComClassificacao = nave
        naveComClassificacao.classificacao = classificacao

        naves.append(naveComClassificacao)
        print("Naves após adicionar: \(naves)")
        salvarNaves()
        reset()
    }
    
    // Salva a lista de naves em persistência local
    func salvarNaves() {
        do {
            let encodedData = try JSONEncoder().encode(naves)
            UserDefaults.standard.set(encodedData, forKey: navesKey)
        } catch {
            print("Falha ao salvar as naves: \(error)")
        }
    }
    
    // Carrega a lista de naves da persistência local, se houver dados salvos
    func carregarNaves() {
       if let savedData = UserDefaults.standard.data(forKey: navesKey) {
           do {
               naves = try JSONDecoder().decode([Nave].self, from: savedData)
           } catch {
               print("Falha ao carregar as naves: \(error)")
           }
       }
   }
    
    // Redefine a nave temporária para seu estado inicial
    func reset() {
        self.nave = Nave(tamanho: .media, cor: .azul, localDaQueda: "", armamentos: "", combustivel: "", potencialDeProspeccaoTecnologica: 0, grauDePericulosidade: 0, grauDeAvaria: .semAvarias, quantidadeDeTripulantes: 0, estadoDosTripulantes: .saudavel)
    }
    
    // Remove uma nave da lista no índice fornecido e salva a lista atualizada
    func removerNave(at offsets: IndexSet) {
        naves.remove(atOffsets: offsets)
        salvarNaves()
    }

}


