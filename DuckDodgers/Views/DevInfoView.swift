//
//  DevInfoView.swift
//  DuckDodgers
//
//  Created by Vinicius Ledis on 21/10/2024.
//

import SwiftUI

struct DevInfoView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color(red:242/255, green: 242/255, blue: 247/255)
                    .ignoresSafeArea()
                
                VStack {
                    VStack(alignment: .leading, spacing: 15) {
                        Text("Informações do Desenvolvedor")
                            .font(.title)
                            .fontWeight(.bold)

                        Text("Nome: Vinicius Peres Ledis")
                        Text("Curso: ADS - 1 Termo")
                        Text("Instituição: FATEC - Garça")
                        Text("E-mail: vinicius.ledis@gmail.com")
                        Text("LinkedIn: linkedin.com/in/viniciusledis")
                        Text("GitHub: github.com/viniciusledis")
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(.white)
                    .cornerRadius(8)
                    .padding()
                    
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    DevInfoView()
}
