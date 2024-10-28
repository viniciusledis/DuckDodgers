//
//  CriteriosIdentificacaoView.swift
//  DuckDodgers
//
//  Created by Vinicius Ledis on 27/10/2024.
//

import SwiftUI

struct CriteriosIdentificacaoView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(red:242/255, green: 242/255, blue: 247/255)
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Critérios para Identificação de Patos")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color(red: 0.2, green: 0.2, blue: 0.3))
                            .multilineTextAlignment(.center)
                            .padding(.leading, 20)
                        
                        Text("Preste atenção aos seguintes aspectos para identificar o tipo de pato:")
                            .font(.title2)
                            .foregroundColor(Color(red: 0.3, green: 0.3, blue: 0.4))
                        
                        // Critério 1 - Cor
                        identificacaoView(
                            title: "Cor",
                            icon: "paintpalette",
                            color: .blue,
                            descricao: "Observe a cor que o pato possui. Xenófagos geralmente têm cores esverdeadas.")
                        
                        // Critério 2 - Velocidade
                        identificacaoView(
                            title: "Velocidade",
                            icon: "speedometer",
                            color: .orange,
                            descricao: "Xenófagos tendem a ser mais rápidos que patos comuns. Observe o movimento e agilidade.")
                        
                        // Critério 3 - Bico Pequeno
                        identificacaoView(
                            title: "Tamanho do Bico",
                            icon: "bird.fill",
                            color: .green,
                            descricao: "Verifique se o pato possui um bico pequeno, um traço comum entre os Xenófagos.")
                        
                        // Critério 4 - Comportamento
                        identificacaoView(
                            title: "Comportamento",
                            icon: "waveform.path.ecg",
                            color: .purple,
                            descricao: "Patos com comportamento agressivo ou estranho podem ser Xenófagos.")
                        
                        // Critério 5 - Sotaque                        
                        identificacaoView(
                            title: "Sotaque",
                            icon: "ellipsis.message",
                            color: .brown,
                            descricao: "Xenófagos possuem um “sotaque” alienígena bem distinto nos seus grasnados.")
                        
                        // Critério 5 - Dias sem comer
                        identificacaoView(
                            title: "Dias Sem Comer",
                            icon: "fish.fill",
                            color: .mint,
                            descricao: "Xenófagos podem ficar varios dias sem se alimentar.")
                        
                        VStack {
                            Spacer()
                        }
                        
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
                    .padding()
                    .background(.white)
                    .cornerRadius(20)
                    .padding()
                }
            }
        }
    }
    
    private func identificacaoView(title: String, icon: String, color: Color, descricao: String) -> some View {
        HStack(spacing: 15) {
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
    CriteriosIdentificacaoView()
}
