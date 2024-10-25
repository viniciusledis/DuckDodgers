//
//  PatoModel.swift
//  DuckDodgers
//
//  Created by Vinicius Ledis on 24/10/2024.
//

import Foundation

struct Pato: Identifiable {
    var id = UUID()
    var nome: String
    var velocidade: Int // Exemplo: 1-10
    var cor: String
    var comportamento: String // Exemplo: "Calmo", "Agressivo"
    var tipo: TipoPato

    enum TipoPato {
        case comum, xenofago
    }
}
