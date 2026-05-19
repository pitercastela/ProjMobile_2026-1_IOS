import SwiftUI

struct TelaConfirmacao: View {
    
    // 1. Recebendo os dados dinâmicos da tela de horários
    var horariosConfirmados: [HorarioQuadra]
    
    // Variável de ambiente para controlar a navegação
    @Environment(\.presentationMode) var presentationMode
    
    // Cor verde escura padrão do layout
    let darkGreen = Color(red: 0.12, green: 0.29, blue: 0.16)
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            
            // --- Ícone de Confirmação ---
            Image(systemName: "checkmark.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 140, height: 140)
                .foregroundColor(darkGreen)
                .padding(.bottom, 30)
            
            // --- Título de Confirmação ---
            Text("Reserva\nconfirmada!")
                .font(.custom("Georgia-Bold", size: 32))
                .multilineTextAlignment(.center)
                .foregroundColor(darkGreen)
            
            // --- Linha Separadora ---
            Rectangle()
                .fill(Color.gray.opacity(0.3))
                .frame(width: 250, height: 1.5)
                .padding(.vertical, 25)
            
            // --- Detalhes da Reserva ---
            VStack(spacing: 10) {
                // Opcional no futuro: Você também pode passar o Nome e a Data da mesma forma que passou os horários!
                Text("Quadra de tênis 1")
                Text("Dia: 15 de Junho")
                
                // 2. Exibindo os horários dinamicamente na mesma linha
                Text("Horário: \(horariosFormatados())")
            }
            .font(.custom("Georgia-Bold", size: 22))
            .foregroundColor(darkGreen)
            .multilineTextAlignment(.center)
            
            Spacer()
            
            // --- Botão Inferior ---
            Button(action: {
                // Ação para voltar
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Voltar ao início")
                    .font(.custom("Georgia-Bold", size: 20))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 18)
                    .background(darkGreen)
                    .cornerRadius(12)
            }
            .padding(.horizontal, 40)
            .padding(.bottom, 50)
        }
        .background(Color.white)
        .edgesIgnoringSafeArea(.all)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
    
    // 3. Função auxiliar para juntar a lista de horários em um texto limpo
    private func horariosFormatados() -> String {
        let horas = horariosConfirmados.map { $0.hora }
        return horas.joined(separator: ", ")
    }
}
