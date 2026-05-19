import SwiftUI

// Componente visual do botão verde grande (Mantido sem alterações)
struct SpaceTypeCardView: View {
    let title: String
    let subtitle: String
    let iconName: String // Nome do ícone na sua pasta Assets
    
    var body: some View {
        HStack(spacing: 20) {
            // Ícone da modalidade
            Image(iconName)
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60)
                .foregroundColor(.white)
            
            // Textos
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.custom("Georgia", size: 17))
                    .foregroundColor(.white)
                
                Text(subtitle)
                    .font(.custom("Georgia", size: 14))
                    .foregroundColor(.white)
            }
            
            Spacer() // Empurra o conteúdo para a esquerda
        }
        .padding(.vertical, 20)
        .padding(.horizontal, 10)
        .background(Color(red: 0.12, green: 0.29, blue: 0.16)) // Verde escuro
        .cornerRadius(12)
        .padding(.horizontal)
        .padding(.vertical, 10)
    }
}

// Tela Principal de Tipos de Espaço
struct SelectSpaceTypeView: View {
    
    // VARIÁVEL ADICIONADA PARA CONTROLAR O RETORNO À HOME
    @Environment(\.presentationMode) var presentationMode
    
    let darkGreen = Color(red: 0.12, green: 0.29, blue: 0.16)
    
    var body: some View {
        VStack(spacing: 0) {
            
            // --- Barra Superior (Header Escuro) ---
            HStack {
                Spacer()
                Button(action: {
                    // Lógica de sair
                }) {
                    Image(systemName: "rectangle.portrait.and.arrow.right")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 22, height: 22)
                        .foregroundColor(.white)
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 10)
            .background(darkGreen)
            
            // --- Área de Título ---
            HStack {
                // AÇÃO DE DISMISS ADICIONADA NO BOTÃO DE VOLTAR
                Button(action: {
                    presentationMode.wrappedValue.dismiss() // Fecha esta tela e volta para a Home
                }) {
                    Image(systemName: "chevron.left")
                        .font(.title3)
                        .foregroundColor(darkGreen)
                }
                
                Text("Selecionar espaço")
                    .font(.custom("Georgia-Bold", size: 24))
                    .foregroundColor(darkGreen)
                
                Spacer()
            }
            .padding(.horizontal)
            .padding(.vertical, 10)
            
            Rectangle().fill(darkGreen).frame(height: 1.5)
            
            // --- Opções de Espaço ---
            ScrollView {
                VStack(spacing: 15) {
                    
                    // 1. Botão de Tênis -> Navega para a tela SelectSpaceView
                    NavigationLink(destination: SelectSpaceView()) {
                        SpaceTypeCardView(title: "Quadra de tênis", subtitle: "5 Disponíveis", iconName: "iconRackets")
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    // 2. Botão Poliesportiva -> Navega para a lista Poliesportiva
                    NavigationLink(destination: SelectPoliesportivaView()) {
                        SpaceTypeCardView(title: "Quadra poliesportiva", subtitle: "3 Disponíveis", iconName: "iconCourt")
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    // 3. Botão Futebol -> Navega para a lista de Futebol
                    NavigationLink(destination: SelectFutebolView()) {
                        SpaceTypeCardView(title: "Campo de futebol", subtitle: "2 Disponíveis", iconName: "iconSoccer")
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                }
                .padding(.top, 25)
            }
        }
        .edgesIgnoringSafeArea(.top)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true) // Garante que o botão nativo fique escondido
    }
}
