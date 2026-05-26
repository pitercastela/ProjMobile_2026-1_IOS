//
//  AppStyle.swift
//  helloWorld
//
//  Created by RODRIGO DE SOUSA FERRETT on 12/05/26.
//
import SwiftUI

extension Color {
    static let ascijaVerdeEscuro = Color(red: 0.07, green: 0.28, blue: 0.16)
    static let ascijaBorda = Color(red: 0.55, green: 0.65, blue: 0.55)
}

struct BotaoOpcaoStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 20, weight: .semibold))
            .foregroundColor(.white)
            .padding(.vertical, 16)
            .padding(.horizontal, 20)
            .frame(maxWidth: .infinity, alignment: .leading) // Alinhamento à esquerda
            .background(Color.ascijaVerdeEscuro)
            .cornerRadius(8)
            .opacity(configuration.isPressed ? 0.8 : 1.0)
    }
}

// Estilo para o botão Confirmar (texto centralizado)
struct BotaoConfirmarStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 20, weight: .bold))
            .foregroundColor(.white)
            .padding(.vertical, 16)
            .frame(maxWidth: .infinity, alignment: .center) // Alinhamento central
            .background(Color.ascijaVerdeEscuro)
            .cornerRadius(8)
            .opacity(configuration.isPressed ? 0.8 : 1.0)
    }
}
