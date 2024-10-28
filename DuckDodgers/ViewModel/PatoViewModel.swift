//
//  PatoViewModel.swift
//  DuckDodgers
//
//  Created by Vinicius Ledis on 26/10/2024.
//

import Foundation

@Observable
class PatoViewModel {
    // Propriedade opcional para armazenar o pato atualmente selecionado
    var patoAtual: Pato?
    
    // Lista fixa de patos com diversas características, representando os diferentes tipos de patos que podem ser gerados ou exibidos no aplicativo
    private let patos: [Pato] = [
        Pato(cor: "Verde", velocidade: 9, bicoPequeno: true, comportamento: .comunicativo, sotaque: true, tempoSemAlimento: 5, ambiente: .cidade, tamanhoBando: 8, tipo: .xenofago),
        
        Pato(cor: "Amarelo", velocidade: 3, bicoPequeno: false, comportamento: .calmo, sotaque: false, tempoSemAlimento: 1, ambiente: .lago, tamanhoBando: 4, tipo: .comum),
        
        Pato(cor: "Azul", velocidade: 2, bicoPequeno: false, comportamento: .comunicativo, sotaque: false, tempoSemAlimento: 2, ambiente: .lago, tamanhoBando: 6, tipo: .comum),

        Pato(cor: "Verde", velocidade: 10, bicoPequeno: true, comportamento: .agitado, sotaque: true, tempoSemAlimento: 4, ambiente: .praia, tamanhoBando: 1, tipo: .xenofago),

        Pato(cor: "Amarelo", velocidade: 3, bicoPequeno: false, comportamento: .agitado, sotaque: false, tempoSemAlimento: 0, ambiente: .floresta, tamanhoBando: 5, tipo: .comum),

        Pato(cor: "Verde ", velocidade: 9, bicoPequeno: true, comportamento: .tecnologico, sotaque: true, tempoSemAlimento: 6, ambiente: .cidade, tamanhoBando: 6, tipo: .xenofago),

        Pato(cor: "Cinza", velocidade: 2, bicoPequeno: false, comportamento: .calmo, sotaque: false, tempoSemAlimento: 1, ambiente: .montanha, tamanhoBando: 6, tipo: .comum),

        Pato(cor: "Verde", velocidade: 10, bicoPequeno: true, comportamento: .tecnologico, sotaque: true, tempoSemAlimento: 5, ambiente: .praia, tamanhoBando: 6, tipo: .xenofago),
        
        Pato(cor: "Laranja", velocidade: 2, bicoPequeno: false, comportamento: .calmo, sotaque: false, tempoSemAlimento: 1, ambiente: .lago, tamanhoBando: 4, tipo: .comum),

        Pato(cor: "Verde", velocidade: 8, bicoPequeno: true, comportamento: .comunicativo, sotaque: true, tempoSemAlimento: 4, ambiente: .floresta, tamanhoBando: 2, tipo: .xenofago),

        Pato(cor: "Cinza", velocidade: 2, bicoPequeno: false, comportamento: .agitado, sotaque: false, tempoSemAlimento: 0, ambiente: .praia, tamanhoBando: 4, tipo: .comum),

        Pato(cor: "Verde", velocidade: 9, bicoPequeno: true, comportamento: .tecnologico, sotaque: true, tempoSemAlimento: 6, ambiente: .cidade, tamanhoBando: 5, tipo: .xenofago),

        Pato(cor: "Branco", velocidade: 2, bicoPequeno: false, comportamento: .calmo, sotaque: false, tempoSemAlimento: 1, ambiente: .montanha, tamanhoBando: 8, tipo: .comum),

        Pato(cor: "Branco", velocidade: 2, bicoPequeno: false, comportamento: .comunicativo, sotaque: false, tempoSemAlimento: 1, ambiente: .lago, tamanhoBando: 7, tipo: .comum),

        Pato(cor: "Verde", velocidade: 10, bicoPequeno: true, comportamento: .tecnologico, sotaque: true, tempoSemAlimento: 6, ambiente: .floresta, tamanhoBando: 1, tipo: .xenofago)
    ]
    
    // Função que seleciona um pato aleatório da lista de patos e o define como o `patoAtual`
    func gerarPatoAleatorio() {
        patoAtual = patos.randomElement()
    }
    
}

