//
//  ListagemNavesView.swift
//  DuckDodgers
//
//  Created by Vinicius Ledis on 21/10/2024.
//

import SwiftUI

struct ListagemNavesView: View {
    @Environment(\.dismiss) var dismiss
    @State var viewModel = NaveViewModel()

    var body: some View {
        NavigationStack {
            ZStack {
                // Lista de naves alienígenas, com informações e links de navegação para a tela de detalhes
                List {
                    ForEach(Array(viewModel.naves.enumerated()), id: \.element.id) { index, nave in
                        // Link de navegação para a tela de detalhes da nave selecionada
                        NavigationLink {
                            DetailView(nave: nave, index: index + 1)
                        } label: {
                            // Exibe as principais informações da nave
                            VStack(alignment: .leading) {
                                Text("Nave \(index + 1)")
                                    .font(.title2.weight(.bold))
                                Text("Classificação: \(nave.classificacao)")
                                Text("Local da Queda: \(nave.localDaQueda)")
                                Text("Tamanho: \(nave.tamanho.rawValue.capitalized)")
                                Text("Cor: \(nave.cor.rawValue.capitalized)")
                            }
                        }
                    }
                    // Permite a remoção de naves da lista
                    .onDelete(perform: viewModel.removerNave)
                }
                .navigationTitle("Etiqueta Galáctica")
                .navigationBarBackButtonHidden()
                .toolbar {
                    // Botão no canto superior direito para adicionar uma nova nave
                    ToolbarItem {
                        NavigationLink {
                            InventarioView()
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                    // Botão no canto superior esquerdo para retornar à tela inicial
                    ToolbarItem(placement: .topBarLeading) {
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "house")
                        }
                    }
                }
            }
        }
        
    }
}

#Preview {
    ListagemNavesView()
}


