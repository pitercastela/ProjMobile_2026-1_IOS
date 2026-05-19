import SwiftUI

struct ReservaUsuarioView: View {
    @State private var dataSelecionada = Date()
    let verdeEscuro = Color(red: 27/255, green: 57/255, blue: 30/255)
    
    // 1. Variável de ambiente que gerencia o retorno na pilha de navegação
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 0) {
            // --- CABEÇALHO DA TELA ---
            HStack {
                // 2. Transformamos a imagem da seta em um botão funcional
                Button(action: {
                    dismiss() // Fecha esta tela e volta para a HomeUsuarioView
                }) {
                    Image(systemName: "chevron.left")
                        .font(.title3)
                        .foregroundColor(.white)
                        .padding(.vertical, 5)
                        .padding(.trailing, 20) // Facilita a área de clique
                }
                
                Spacer()
                
                Text("Reservas")
                    .font(.system(size: 20, weight: .bold, design: .serif))
                
                Spacer()
                
                Image(systemName: "rectangle.portrait.and.arrow.right")
            }
            .padding()
            .background(verdeEscuro)
            .foregroundColor(.white)

            // --- FILTRO DE DATA ---
            ZStack {
                HStack {
                    Text(dataSelecionada, format: .dateTime.day().month(.wide))
                        .font(.system(size: 20, weight: .bold, design: .serif))
                        .foregroundColor(verdeEscuro)
                    Spacer()
                    Image(systemName: "calendar")
                        .font(.system(size: 22))
                        .foregroundColor(verdeEscuro)
                }
                .padding(.horizontal, 15)
                .padding(.vertical, 10)
                .background(Color.white)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                )

                DatePicker("", selection: $dataSelecionada, displayedComponents: .date)
                    .labelsHidden()
                    .datePickerStyle(.compact)
                    .opacity(0.011)
            }
            .padding(.horizontal)
            .padding(.top, 25)
            .padding(.bottom, 15)

            // --- LISTA DE RESERVAS ---
            ScrollView {
                VStack(spacing: 16) {
                    CardReservaSimples(
                        titulo: "Quadra de tênis 1",
                        horario: "10h - 12h",
                        data: dataSelecionada
                    )
                    
                    CardReservaSimples(
                        titulo: "Campo de futebol 2",
                        horario: "16h - 19h",
                        data: dataSelecionada
                    )
                    
                    CardReservaSimples(
                        titulo: "Quadra poliesportiva 1",
                        horario: "16h - 19h",
                        data: dataSelecionada
                    )
                }
                .padding(.horizontal)
            }
            
            Spacer()
        }
        .navigationBarHidden(true)
    }
}

// --- COMPONENTE DO CARD DE RESERVA ---
struct CardReservaSimples: View {
    var titulo: String
    var horario: String
    var data: Date
    let verdeEscuro = Color(red: 27/255, green: 57/255, blue: 30/255)

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(titulo)
                .font(.system(size: 18, weight: .bold, design: .serif))
                .foregroundColor(verdeEscuro)
            
            Divider()
            
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text(data, format: .dateTime.day().month(.wide))
                    Text(horario)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Spacer()
                
                NavigationLink(destination: ConfirmaCancelamentoUsuarioView(
                    tituloReserva: titulo,
                    dataReserva: data.formatted(.dateTime.day().month(.wide)),
                    horarioReserva: horario
                )) {
                    Text("Cancelar")
                        .font(.system(size: 14, weight: .bold))
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(verdeEscuro)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(verdeEscuro.opacity(0.3), lineWidth: 1)
        )
    }
}
