//
//  InventarioView.swift
//  DuckDodgers
//
//  Created by Vinicius Ledis on 18/10/2024.
//

import SwiftUI

struct InventarioView: View {
    @Environment(\.dismiss) var dismiss
    @State private var viewModel = NaveViewModel()
    @State private var navigateToListaDeNaves = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                Form {
                    Section(header: Text("Informaçōes da Nave")) {
                        
                        Picker(selection: $viewModel.nave.tamanho) {
                            ForEach(Nave.Tamanho.allCases, id: \.self) { tamanho in
                                Text(tamanho.rawValue.capitalized)
                            }
                        } label: {
                            Text("Tamanho")
                                .foregroundStyle(.black)
                        }
                        
                        
                        Picker(selection: $viewModel.nave.cor) {
                            ForEach(Nave.Cor.allCases, id: \.self) { cor in
                                Text(cor.rawValue.capitalized)
                            }
                        } label: {
                            Text("Cor")
                                .foregroundStyle(.black)
                        }
                        
                        TextField(text: $viewModel.nave.localDaQueda) {
                            Text("Local da Queda")
                        }
                        
                        TextField(text: Binding(
                            get: { viewModel.nave.armamentos ?? "" },
                            set: { viewModel.nave.armamentos = $0.isEmpty ? nil : $0 }
                        )) {
                            Text("Armamentos")
                        }
                        
                        TextField(text: $viewModel.nave.combustivel) {
                            Text("Tipo de Combustível")
                        }
                        
                        Picker(selection: $viewModel.nave.grauDeAvaria) {
                            ForEach(Nave.GrauDeAvaria.allCases, id: \.self) { avaria in
                                Text(avaria.rawValue.capitalized)
                            }
                        } label: {
                            Text("Grau de Avaria")
                                .foregroundStyle(.black)
                        }
                        
                        Stepper(value: $viewModel.nave.potencialDeProspeccaoTecnologica, in: 0...100, step: 10) {
                            Text("Potencial Tecnologico: \(viewModel.nave.potencialDeProspeccaoTecnologica)%")
                                .font(.system(size: 16))
                        }
                    }
                    .foregroundStyle(.black)
                    
                    Section(header: Text("Informaçōes dos Tripulantes")) {
                        Stepper(value: $viewModel.nave.quantidadeDeTripulantes, in: 0...20) {
                            Text("Quantidade de Tripulantes: \(viewModel.nave.quantidadeDeTripulantes)")
                                .font(.system(size: 16))
                        }
                        
                        
                        Picker(selection: $viewModel.nave.estadoDosTripulantes) {
                            ForEach(Nave.Saude.allCases, id: \.self) { saude in
                                Text(saude.rawValue.capitalized)
                            }
                        } label: {
                            Text("Saude dos Tripulantes")
                                .foregroundStyle(.black)
                        }
                    }
                    .foregroundStyle(.black)
                    
                }
                
                VStack {
                    Spacer()
                    
                    HStack(spacing: 40) {
                        Button {
                            dismiss()
                        } label: {
                            Text("Cancelar")
                        }
                        .padding()
                        .padding(.horizontal, 20)
                        .background(.red)
                        .clipShape(.capsule)
                        .foregroundStyle(.white)
                        
                        Button {
                            viewModel.gerarRelatorio(nave: viewModel.nave)
                            navigateToListaDeNaves = true
                        } label: {
                            Text("Gerar Relatorio")
                        }
                        .padding()
                        .background(.green)
                        .clipShape(.capsule)
                        .foregroundStyle(.white)
                        
                    }
                }

            }
            .navigationTitle("Inventário Estelar")
            .navigationDestination(isPresented: $navigateToListaDeNaves) {
               ListagemNavesView()
           }
        }
    }
}

#Preview {
    InventarioView()
}
