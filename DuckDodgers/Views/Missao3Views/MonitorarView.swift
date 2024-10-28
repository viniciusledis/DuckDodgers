//
//  MonitorarView.swift
//  DuckDodgers
//
//  Created by Vinicius Ledis on 26/10/2024.
//

import SwiftUI

struct MonitorarView: View {
    @State private var viewModel = PatoViewModel()
    @State private var estrategiaCaptura: String?
    @State private var armaSugerida: String?
    @State private var isLoading = false
    @State private var mostrarAlerta = false
    @State private var mensagemAlerta = ""
    @State private var identificador = ""
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(red:242/255, green: 242/255, blue: 247/255)
                    .ignoresSafeArea()
                
                // Condicional para exibir o progresso de carregamento ou o conteúdo principal
                if isLoading {
                    VStack {
                        Text("Escaneando Pato...")
                            .font(.largeTitle)
                            .foregroundColor(Color(red: 0.2, green: 0.2, blue: 0.3))
                        
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: Color(red: 0.2, green: 0.2, blue: 0.3)))
                    }
                } else {
                    VStack(spacing: 20) {
                        Spacer()
                        
                        // Verifica se um pato foi encontrado no viewModel
                        if let pato = viewModel.patoAtual {
                            Text("Pato encontrado!")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(Color(red: 0.2, green: 0.2, blue: 0.3))
                            
                            // Exibe as características do pato encontrado
                            VStack(alignment: .leading, spacing: 10) {
                                Text("Caracteristicas:")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color(red: 0.2, green: 0.2, blue: 0.3))
                                
                                Text("Cor: \(pato.cor)")
                                Text("Velocidade: \(pato.velocidade)")
                                Text("Bico Pequeno: \(pato.bicoPequeno == true ? "Sim" : "Não")")
                                Text("Comportamento: \(pato.comportamento.rawValue)")
                                Text("Sotaque: \(pato.sotaque == true ? "Sim" : "Não")")
                                Text("Tempo Sem Alimentação: \(pato.tempoSemAlimento) dias")
                                Text("Ambiente: \(pato.ambiente.rawValue)")
                                Text("Tamanho do Bando: \(pato.tamanhoBando)")
                            }
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(.white)
                            .cornerRadius(12)
                            
                            Text("Esse é um...")
                                .font(.title)
                                .foregroundColor(Color(red: 0.2, green: 0.2, blue: 0.3))
                            
                            // Botões para classificar o tipo de pato
                            HStack(spacing: 20) {
                                Button(action: {
                                    identificador = "xenofago"
                                    verificarPato(tipo: viewModel.patoAtual!.tipo)
                                }) {
                                    Text("Xenófago")
                                        .padding()
                                        .background(Color.red)
                                        .foregroundColor(.white)
                                        .cornerRadius(12)
                                }
                                
                                Button(action: {
                                    identificador = "comum"
                                    verificarPato(tipo: viewModel.patoAtual!.tipo)
                                }) {
                                    Text("Pato Comum")
                                        .padding()
                                        .background(Color.green)
                                        .foregroundColor(.white)
                                        .cornerRadius(12)
                                }
                            }
                        } else {
                            // Texto inicial exibido quando nenhum pato foi escaneado
                            Text("Operação Visão de Captura")
                                .font(.largeTitle)
                                .foregroundColor(Color(red: 0.2, green: 0.2, blue: 0.3))
                                .multilineTextAlignment(.center)
                            
                            Image(systemName: "sunglasses")
                                .font(.system(size: 150))
                                .foregroundColor(Color(red: 0.2, green: 0.2, blue: 0.3))
                        }
                        
                        Spacer()
                        
                        // Botão para escanear um novo pato
                        Button {
                            escanearPato()
                        } label: {
                            Text("Escanear Novo Pato")
                                .padding()
                                .background(Color(red: 0.2, green: 0.2, blue: 0.3))
                                .foregroundColor(.white)
                                .cornerRadius(12)
                        }
                        .padding(.bottom)
                    }
                    .padding()
                }
            }
            // Botão de informação que leva para a CriteriosIdentificacaoView que explica como identificar Xenófagos
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: CriteriosIdentificacaoView()) {
                        Image(systemName: "info.circle")
                    }
                }
            }
            // Exibe o alerta com base na identificação realizada pelo usuario
            .alert(isPresented: $mostrarAlerta) {
                Alert(
                    title: Text(viewModel.patoAtual?.tipo == .comum && identificador == "comum" ? "Correto" : "Identificação Incorreta"),
                    message: Text(mensagemAlerta),
                    dismissButton: .default(Text("Ok"), action: {
                        escanearPato()
                    })
                )
            }
            // Caso encontre um Xenófago, exibe uma tela com a estratégia de captura e arma sugerida
            .sheet(isPresented: Binding(
                get: { estrategiaCaptura != nil && armaSugerida != nil },
                set: { if !$0 { estrategiaCaptura = nil; armaSugerida = nil } }
            )){
                VStack(spacing: 20) {
                    Text("Você encontrou um Xenófago!!")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.red)
                    
                    VStack(spacing: 5) {
                        Text("Estrategia de Captura")
                            .font(.title2)
                            .fontWeight(.semibold)
                        .foregroundColor(Color(red: 0.2, green: 0.2, blue: 0.3))
                        
                        Text(estrategiaCaptura!)
                            .font(.body)
                            .padding()
                            .background(Color(red: 0.9, green: 0.9, blue: 0.9))
                            .cornerRadius(12)
                    }
                    
                    VStack(spacing: 5) {
                        Text("Arma Sugerida")
                            .font(.title2)
                            .fontWeight(.semibold)
                        .foregroundColor(Color(red: 0.2, green: 0.2, blue: 0.3))
                        
                        Text(armaSugerida!)
                            .font(.body)
                            .padding()
                            .background(Color(red: 0.9, green: 0.9, blue: 0.9))
                            .cornerRadius(12)
                    }
                    
                    Spacer()
                    
                    // Botão para escanear um novo pato a partir da tela aberta
                    Button {
                        estrategiaCaptura = nil
                        armaSugerida = nil
                        
                        escanearPato()
                    } label: {
                        Text("Escanear Novo Pato")
                            .padding()
                            .background(Color(red: 0.2, green: 0.2, blue: 0.3))
                            .foregroundColor(.white)
                            .cornerRadius(12)
                    }
                }
                .presentationDetents([.fraction(0.5)])
                .padding()
            }
        }
    }
    
    // Função para gerar um novo pato com um atraso de `escaneamento`
    private func escanearPato() {
        isLoading = true
        
        // Simula o atraso do escaneamento com uma chamada assíncrona
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            viewModel.gerarPatoAleatorio()
            isLoading = false
        }
    }
    
    // Função para verificar a identificação do pato e exibir as mensagens correspondentes
    private func verificarPato(tipo: Pato.TipoPato) {
        if tipo == .xenofago && identificador == "xenofago" {
            let estrategiaArma = viewModel.patoAtual!.estrategiaCaptura()
            estrategiaCaptura = estrategiaArma.estrategia
            armaSugerida = estrategiaArma.arma
        } else if tipo == .comum && identificador == "xenofago" {
            // Define a mensagem de erro
            mensagemAlerta = "Você identificou um pato comum como Xenófago!"
            mostrarAlerta = true // Mostra o alerta
        } else if tipo == .xenofago && identificador == "comum" {
            mensagemAlerta = "Você identificou um Xénofago como um pato comum!"
            mostrarAlerta = true
        } else if tipo == .comum && identificador == "comum" {
            mensagemAlerta = "Correto, esse é um pato comum, continue procurando..."
            mostrarAlerta = true
        }
    }
}


#Preview {
    MonitorarView()
}
