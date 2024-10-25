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
                List {
                    ForEach(Array(viewModel.naves.enumerated()), id: \.element.id) { index, nave in
                        NavigationLink {
                            DetailView(nave: nave, index: index + 1)
                        } label: {
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
                    .onDelete(perform: viewModel.removerNave)
                }
                .navigationTitle("Etiqueta Galáctica")
                .navigationBarBackButtonHidden()
                .toolbar {
                    ToolbarItem {
                        NavigationLink {
                            InventarioView()
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
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


