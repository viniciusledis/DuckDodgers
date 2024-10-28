//
//  HomePageView.swift
//  DuckDodgers
//
//  Created by Vinicius Ledis on 21/10/2024.
//

import SwiftUI

struct HomePageView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 0.1, green: 0.1, blue: 0.2)
                    .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    Text("Bem-vindo ao DuckDodgers!")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding()
                        .foregroundColor(.white)
                    
                    // Botão de navegação para a primeira missão
                    NavigationLink(destination: InventarioView()) {
                        MissionButton(title: "Missão 1: Operação Inventário Estelar")
                            .padding()
                    }
                    
                    // Botão de navegação para a segunda missão
                    NavigationLink(destination: ListagemNavesView()) {
                        MissionButton(title: "Missão 2: Missão Etiqueta Galáctica")
                            .padding()
                    }
                    
                    // Botão de navegação para a terceira missão
                    NavigationLink(destination: MonitorarView()) {
                        MissionButton(title: "Missão 3: Operação Visão de Captura")
                            .padding()
                    }
                    
                    Spacer()
                }
                // Barra de ferramentas no topo, com ícone de informações sobre o desenvolvedor.
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink(destination: DevInfoView()) {
                            Image(systemName: "info.circle")
                        }
                    }
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
}

// Componente reutilizável para os botões de missão
struct MissionButton: View {
    let title: String

    var body: some View {
        Text(title)
            .font(.title2)
            .fontWeight(.semibold)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color(red: 223/255, green: 117/255, blue: 37/255))
            .foregroundColor(.white)
            .cornerRadius(10)
            .shadow(radius: 5)
    }
}

#Preview {
    HomePageView()
}

