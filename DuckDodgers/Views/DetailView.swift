//
//  DetailView.swift
//  DuckDodgers
//
//  Created by Vinicius Ledis on 21/10/2024.
//

import SwiftUI

struct DetailView: View {
    var nave: Nave
    var index: Int

    var body: some View {
        NavigationStack {
            ZStack {
                Color(red:242/255, green: 242/255, blue: 247/255)
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Nave \(index)")
                            .font(.largeTitle)
                            .foregroundColor(Color(red: 0.2, green: 0.2, blue: 0.3))
                            .padding(.bottom, 5)
                            .fontWeight(.bold)
                        
                        VStack(alignment: .leading) {
                            Text("Classificação: \(nave.classificacao)")
                                .font(.title2)
                                .fontWeight(.semibold)
                            
                            Text(classificacaoDescricao(classificacao: nave.classificacao))
                                .font(.body)

                        }
                        .padding()
                        .background(.white)
                        .cornerRadius(8)
                        .frame(alignment: .leading)
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Informaçōes:")
                                .font(.title2)
                                .fontWeight(.semibold)
                            
                            Text("Local da Queda: \(nave.localDaQueda)")
                            
                            Text("Tamanho: \(nave.tamanho.rawValue.capitalized)")
                            
                            Text("Cor: \(nave.cor.rawValue.capitalized)")
                            
                            Text("Armamentos: \(nave.armamentos ?? "Nenhum")")
                            
                            Text("Combustível: \(nave.combustivel)")
                            
                            Text("Potencial de Prospeção Tecnológica: \(nave.potencialDeProspeccaoTecnologica)")
                            
                            Text("Grau de Periculosidade: \(nave.grauDePericulosidade)")
                            
                            Text("Grau de Avaria: \(nave.grauDeAvaria.rawValue.capitalized)")
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(.white)
                        .cornerRadius(8)
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Tripulação:")
                                .font(.title2)
                                .fontWeight(.semibold)
                                
                            
                            Text("Quantidade de Tripulantes: \(nave.quantidadeDeTripulantes)")
                            
                            Text("Estado dos Tripulantes: \(nave.estadoDosTripulantes.rawValue.capitalized)")
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .background(.white)
                        .cornerRadius(8)
                      
                    }
                    .padding(16)
                    .clipShape(.rect(cornerRadius: 10))
                }
                .navigationTitle("Detalhes da Nave")
            .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
    
    func classificacaoDescricao(classificacao: String) -> String {
        switch classificacao {
        case "Sucata Espacial":
            return "A nave está muito danificada e tem pouco valor tecnológico, mas suas peças podem ser reutilizadas para reparos em outras naves."
        case "Joia Tecnológica":
            return "Contém tecnologias avançadas que podem ser estudadas e adaptadas para futuras explorações e inovações."
        case "Arsenal Alienígena":
            return "A nave possui armamentos que podem ser estudados e usados para reforçar a segurança, bem como desenvolver novas tecnologias de defesa."
        case "Ameaça em Potencial":
            return "A nave representa um nível elevado de risco, com armadilhas ou sistemas que podem representar uma ameaça, necessitando de cautela ao ser abordada."
        case "Fonte de Energia Alternativa":
            return "A nave contém sistemas de propulsão ou energia únicos que podem ser úteis para futuras explorações e desenvolvimento de novas fontes de energia."
        case "Exploradora Espacial":
            return "A nave está equipada para missões de exploração, podendo descobrir novos planetas ou recursos valiosos."
        case "Nave de Transporte de Cargas":
            return "Capaz de transportar grandes quantidades de materiais ou equipamentos, útil para missões de logística e suporte."
        case "Nave Diplomática":
            return "Pode ser utilizada para estabelecer relações diplomáticas com outras espécies, favorecendo negociações pacíficas."
        case "Nave Científica":
            return "Ideal para missões de pesquisa e coleta de dados, contribuindo para o avanço do conhecimento sobre o universo."
        default:
            return "Classificação indefinida. Mais informações são necessárias para determinar seu valor e utilidade."
        }
    }
}


#Preview {
    let viewModel = NaveViewModel()
    return DetailView(nave: viewModel.nave, index: 1)
}
