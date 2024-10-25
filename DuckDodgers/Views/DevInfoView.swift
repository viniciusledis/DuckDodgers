//
//  DevInfoView.swift
//  DuckDodgers
//
//  Created by Vinicius Ledis on 21/10/2024.
//

import SwiftUI

struct DevInfoView: View {
    var body: some View {
        ZStack {            
            VStack(alignment: .leading, spacing: 15) {
                Text("Informações do Desenvolvedor")
                    .font(.title)
                    .fontWeight(.bold)

                Text("Nome: Vinicius Peres Ledis")
                Text("Curso: ADS - 1 Termo")
                Text("Instituição: FATEC - Garça")
                Text("E-mail: vinicius.ledis@gmail.com")
                Text("LinkedIn: vinicius.ledis@gmail.com")
                Text("GitHub: vinicius.ledis@gmail.com")
                Text("Documentação do App: [Link para a documentação]")

                Spacer()
            }
            .padding(.top, 30)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
        }
    }
}

#Preview {
    DevInfoView()
}
