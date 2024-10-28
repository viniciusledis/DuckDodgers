//
//  CriteriosClassificacaoView.swift
//  DuckDodgers
//
//  Created by Vinicius Ledis on 27/10/2024.
//

import SwiftUI

struct CriteriosClassificacaoView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(red:242/255, green: 242/255, blue: 247/255)
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Critérios para Classificação das Naves")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color(red: 0.2, green: 0.2, blue: 0.3))
                            .multilineTextAlignment(.center)
                            .padding(.leading, 10)
                        
                        Text("Cada nave alienígena é classificada com base em seus danos, tecnologia, armamentos, combustível e características da tripulação:")
                            .font(.title2)
                            .foregroundColor(Color(red: 0.3, green: 0.3, blue: 0.4))
                        
                        // Critério 1 - Sucata Espacial
                        classificacaoView(
                            title: "Sucata Espacial",
                            icon: "trash",
                            color: .gray,
                            descricao: "Naves com perda total ou muito danificadas. Estas são consideradas sucata espacial e possuem pouco ou nenhum valor de estudo."
                        )
                        
                        // Critério 2 - Joia Tecnológica
                        classificacaoView(
                            title: "Joia Tecnológica",
                            icon: "diamond.fill",
                            color: .blue,
                            descricao: "Naves com alta prospecção tecnológica (acima de 70) e potencial para inovação científica."
                        )
                        
                        // Critério 3 - Arsenal Alienígena
                        classificacaoView(
                            title: "Arsenal Alienígena",
                            icon: "shield.lefthalf.fill",
                            color: .red,
                            descricao: "Naves armadas e perigosas (periculosidade acima de 60) representam riscos elevados e possíveis usos militares."
                        )
                        
                        // Critério 4 - Ameaça em Potencial
                        classificacaoView(
                            title: "Ameaça em Potencial",
                            icon: "exclamationmark.triangle.fill",
                            color: .orange,
                            descricao: "Naves com grau de periculosidade superior a 80 são classificadas como ameaças em potencial, exigindo monitoramento constante."
                        )
                        
                        // Critério 5 - Fonte de Energia Alternativa
                        classificacaoView(
                            title: "Fonte de Energia Alternativa",
                            icon: "bolt.fill",
                            color: .yellow,
                            descricao: "Naves com combustível desconhecido que representam oportunidades de exploração de novas fontes energéticas."
                        )
                        
                        // Critério 6 - Exploradora Espacial
                        classificacaoView(
                            title: "Exploradora Espacial",
                            icon: "globe",
                            color: .green,
                            descricao: "Naves que utilizam combustível raro, como Urânio ou exótico, e têm potencial tecnológico significativo (acima de 50) são exploradoras espaciais."
                        )
                        
                        // Critério 7 - Nave de Transporte de Cargas
                        classificacaoView(
                            title: "Nave de Transporte de Cargas",
                            icon: "cube.box.fill",
                            color: .purple,
                            descricao: "Naves com mais de 10 tripulantes e baixa periculosidade (abaixo de 30), projetadas para transporte de cargas."
                        )
                        
                        // Critério 8 - Nave Diplomática
                        classificacaoView(
                            title: "Nave Diplomática",
                            icon: "hand.raised.fill",
                            color: .pink,
                            descricao: "Naves com poucos tripulantes (menos de 5), alto potencial tecnológico (acima de 70) e sem armamentos, designadas para missões diplomáticas."
                        )
                        
                        // Critério 9 - Nave Científica
                        classificacaoView(
                            title: "Nave Científica",
                            icon: "book.fill",
                            color: .teal,
                            descricao: "Naves com alta prospecção tecnológica (acima de 80), sem armamentos e com tripulação saudável, focadas em pesquisa científica."
                        )
                        
                        // Critério 10 - Indefinido
                        classificacaoView(
                            title: "Indefinido",
                            icon: "questionmark.circle.fill",
                            color: .gray,
                            descricao: "Naves que não se enquadram em nenhuma categoria específica devido à falta de informações ou características inconclusivas."
                        )
                        
                        Spacer()
                        
                        Button {
                            dismiss()
                        } label: {
                            Text("Entendi!")
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color(red: 0.2, green: 0.2, blue: 0.3))
                                .foregroundColor(.white)
                                .cornerRadius(12)
                        }
                    }
                }
                .padding()
                .background(.white)
                .cornerRadius(20)
                .padding()
            }
        }
    }
    
    private func classificacaoView(title: String, icon: String, color: Color, descricao: String) -> some View {
        HStack(alignment: .top, spacing: 15) {
            Image(systemName: icon)
                .foregroundColor(color)
                .font(.title)
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.primary)
                Text(descricao)
                    .foregroundColor(.secondary)
            }
        }
    }
}

#Preview {
    CriteriosClassificacaoView()
}
