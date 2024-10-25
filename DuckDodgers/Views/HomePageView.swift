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

                    NavigationLink(destination: InventarioView()) {
                        MissionButton(title: "Missão 1: Operação Inventário Estelar")
                            .padding()
                    }

                    NavigationLink(destination: ListagemNavesView()) {
                        MissionButton(title: "Missão 2: Missão Etiqueta Galáctica")
                            .padding()
                    }

                    NavigationLink(destination: EmptyView()) {
                        MissionButton(title: "Missão 3: Operação Visão de Captura")
                            .padding()
                    }
                    

                    Spacer()
                }
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

