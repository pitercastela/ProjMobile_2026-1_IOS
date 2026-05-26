import SwiftUI

struct ConfirmacaoInterditacaoView: View {
    // Variáveis recebidas da tela anterior
    var quadra: String
    var dataInicio: String
    var horarioInicio: String
    var dataFim: String
    var horarioFim: String
    
    // Ambiente para fechar a tela e voltar ao início
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack(spacing: 0) {
            // 1. Barra superior verde (para manter a identidade da tela anterior)
            Color.ascijaVerdeEscuro
                .frame(height: 44)
                .edgesIgnoringSafeArea(.top)
            
            Spacer()
            
            // 2. Ícone de Confirmação
            Image(systemName: "checkmark.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .padding(.bottom, 20)
                .foregroundColor(.ascijaVerdeEscuro)
            
            // 3. Título de Sucesso
            VStack(spacing: 5) {
                Text("Manutenção")
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(.ascijaVerdeEscuro)

                Text("confirmada!")
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(.ascijaVerdeEscuro)
            }
            
            // Linha divisória centralizada
            Rectangle()
                .fill(Color.ascijaBorda)
                .frame(width: 200, height: 1)
                .padding(.vertical, 20)
            
            // 4. Blocos de Informação (Usando as variáveis recebidas)
            VStack(spacing: 25) {
                // Nome da Quadra
                Text(quadra)
                    .font(.system(size: 22, weight: .bold))
                    .foregroundColor(.ascijaVerdeEscuro)

                // Bloco Início
                VStack(spacing: 8) {
                    Text("Dia início: \(dataInicio)")
                    Text("Horário início: \(horarioInicio)")
                }
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(.ascijaVerdeEscuro)

                // Bloco Término
                VStack(spacing: 8) {
                    Text("Dia término: \(dataFim)")
                    Text("Horário término: \(horarioFim)")
                }
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(.ascijaVerdeEscuro)
            }
            
            Spacer()
            
            Divider()
            
            // 5. Botão Voltar (Usando o estilo padronizado)
            NavigationLink(destination: HomeAdminView()) {
                Text("Voltar ao início")
                    .font(Font.system(size: 20, weight: .bold, design: .serif))
                    .foregroundColor(.white)
                    .frame(width: 170, height: 45)
                    .background(Color.ascijaVerdeEscuro)
                    .cornerRadius(8)
            }
            .padding(.horizontal, 40)
            .padding(.bottom, 15)
            .padding(.top, 15)
        }
        // Esconde a barra de navegação padrão do sistema para usar o nosso design
        .navigationBarHidden(true)
    }
}


