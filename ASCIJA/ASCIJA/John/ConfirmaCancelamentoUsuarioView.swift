import SwiftUI

struct ConfirmaCancelamentoUsuarioView: View {
    var tituloReserva: String
    var dataReserva: String
    var horarioReserva: String
    
    let verdeEscuro = Color(red: 27/255, green: 57/255, blue: 30/255)
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 30) {
            Spacer()
            
            Image(systemName: "checkmark.circle.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(verdeEscuro)
            
            Text("Cancelamento\nconfirmado!")
                .font(.title2)
                .bold()
                .multilineTextAlignment(.center)
            
            Divider().padding(.horizontal, 40)
            
            VStack(spacing: 5) {
                Text(tituloReserva).bold()
                Text("Dia: \(dataReserva)")
                Text("Horário: \(horarioReserva)")
            }
            .font(.body)
            
            Spacer()
            
            Button(action: {
                dismiss()
            }) {
                Text("Voltar ao início")
                    .bold()
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(verdeEscuro)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding(.horizontal, 40)
            .padding(.bottom, 40)
        }
        .navigationBarHidden(true)
    }
}
