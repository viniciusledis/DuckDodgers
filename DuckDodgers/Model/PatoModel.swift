//
//  PatoModel.swift
//  DuckDodgers
//
//  Created by Vinicius Ledis on 24/10/2024.
//

import Foundation

struct Pato: Identifiable {
    var id = UUID()
    var cor: String
    var velocidade: Int
    var bicoPequeno: Bool
    var comportamento: Comportamento
    var sotaque: Bool
    var tempoSemAlimento: Int
    var ambiente: Ambiente
    var tamanhoBando: Int
    var tipo: TipoPato

    enum TipoPato: String, CaseIterable, Codable {
        case comum = "Comum", xenofago = "Xenófago"
    }
    
    enum Comportamento: String, CaseIterable, Codable {
        case comunicativo = "Comunicativo", tecnologico = "Tecnologico", calmo = "Calmo", agitado = "Agitado"
    }
    
    enum Ambiente: String, CaseIterable, Codable {
        case floresta = "Floresta", cidade = "Cidade", lago = "Lago", montanha = "Montanha", praia = "Praia"
    }
    
    func estrategiaCaptura() -> (estrategia: String, arma: String) {
        let estrategia: String
        let arma: String
        
        // Definindo a estratégia e a arma com base no ambiente e no tamanho do bando
        switch ambiente {
        case .floresta:
            estrategia = tamanhoBando > 5 ? "Usar iscas e cercos em grupo" : "Aproximação silenciosa e redes"
            arma = "Rede de captura"
            
        case .cidade:
            estrategia = tamanhoBando > 5 ? "Isolamento de área urbana" : "Aproximação rápida"
            arma = "Arma tranquilizante"
            
        case .lago:
            estrategia = tamanhoBando > 5 ? "Barreira aquática" : "Redes de mergulho"
            arma = "Rede aquática"
            
        case .montanha:
            estrategia = tamanhoBando > 5 ? "Posicionamento estratégico de atiradores" : "Armadilhas camufladas"
            arma = "Sniper tranquilizante"
            
        case .praia:
            estrategia = tamanhoBando > 5 ? "Redes ao longo da costa" : "Captura direta"
            arma = "Lança-redes"
        }

        return (estrategia, arma)
    }
}

