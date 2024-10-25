//
//  InventarioViewModel.swift
//  DuckDodgers
//
//  Created by Vinicius Ledis on 18/10/2024.
//

import Foundation
import SwiftUI

@Observable
class NaveViewModel {
    var nave: Nave
    var naves: [Nave] = []
    
    
   private let navesKey = "navesKey"
    
    init() {
        self.nave = Nave(tamanho: .media, cor: .azul, localDaQueda: "", armamentos: "", combustivel: "", potencialDeProspeccaoTecnologica: 0, grauDePericulosidade: 0, grauDeAvaria: .semAvarias, quantidadeDeTripulantes: 0, estadoDosTripulantes: .saudavel)
        carregarNaves()
    }
    

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
    

        
//      Sucata Espacial -
//        Critérios:
//        Grau de avaria: "perda total" ou "muito destruída"
//        Potencial tecnológico: baixo (ex.: < 30)
//        Explicação: A nave está muito danificada e tem pouco valor tecnológico, mas suas peças podem ser reutilizadas.
//
//      Joia Tecnológica:
//        Critérios:
//        Potencial tecnológico: alto (ex.: > 70)
//        Grau de avaria: "parcialmente destruída" ou melhor
//        Explicação: Contém tecnologias avançadas que podem ser estudadas e adaptadas.
//
//      Arsenal Alienígena:
//        Critérios:
//        Armamentos: presente (não nulo)
//        Grau de periculosidade: alto (ex.: > 60)
//        Explicação: A nave possui armamentos que podem ser estudados e usados para reforçar a segurança.
//
//      Ameaça em Potencial:
//        Critérios:
//        Grau de periculosidade: muito alto (ex.: > 80)
//        Armamentos: presente, com sistemas hostis ou perigosos
//        Explicação: A nave tem um nível de risco elevado, com armadilhas ou sistemas que representam uma ameaça.
//
//      Fonte de Energia Alternativa:
//        Critérios:
//        Tipo de combustível: exótico ou desconhecido
//        Potencial tecnológico: moderado a alto (ex.: > 50)
//        Explicação: A nave contém sistemas de propulsão ou energia únicos que podem ser úteis para futuras explorações.

    
    func gerarRelatorio(nave: Nave) {
        let classificacao = classificarNave(nave: nave)
        var naveComClassificacao = nave
        naveComClassificacao.classificacao = classificacao

        naves.append(naveComClassificacao)
        print("Naves após adicionar: \(naves)")
        salvarNaves()
        reset()
    }
    
    func salvarNaves() {
        do {
            let encodedData = try JSONEncoder().encode(naves)
            UserDefaults.standard.set(encodedData, forKey: navesKey)
        } catch {
            print("Falha ao salvar as naves: \(error)")
        }
    }
    
    func carregarNaves() {
       if let savedData = UserDefaults.standard.data(forKey: navesKey) {
           do {
               naves = try JSONDecoder().decode([Nave].self, from: savedData)
           } catch {
               print("Falha ao carregar as naves: \(error)")
           }
       }
   }
    
    
    func reset() {
        self.nave = Nave(tamanho: .media, cor: .azul, localDaQueda: "", armamentos: "", combustivel: "", potencialDeProspeccaoTecnologica: 0, grauDePericulosidade: 0, grauDeAvaria: .semAvarias, quantidadeDeTripulantes: 0, estadoDosTripulantes: .saudavel)
    }
    
    func removerNave(at offsets: IndexSet) {
        naves.remove(atOffsets: offsets)
        salvarNaves()
    }

}


