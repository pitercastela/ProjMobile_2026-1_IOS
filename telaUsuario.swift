import SwiftUI

// 1. Definição do modelo (Essencial para o código compilar)
struct HorarioQuadra: Identifiable {
    let id = UUID()
    let hora: String
    var status: StatusHorario
}

enum StatusHorario {
    case disponivel, selecionado, reservado
}

struct TelaUsuario: View {
    // Cores
    let verdeEscuro = Color(red: 22/255, green: 73/255, blue: 43/255)
    let verdeClaro = Color(red: 104/255, green: 139/255, blue: 115/255)
    let vermelho = Color(red: 139/255, green: 26/255, blue: 26/255)
    
    // VARIÁVEL DE AMBIENTE ADICIONADA PARA O BOTÃO DE VOLTAR FUNCIONAR
    @Environment(\.presentationMode) var presentationMode
    
    @State private var dataSelecionada = Date()
    @State private var mostrarCalendario = false
    @State private var horarios: [HorarioQuadra] = [
        HorarioQuadra(hora: "6:00", status: .disponivel),
        HorarioQuadra(hora: "7:00", status: .disponivel),
        HorarioQuadra(hora: "8:00", status: .disponivel),
        HorarioQuadra(hora: "9:00", status: .disponivel),
        HorarioQuadra(hora: "10:00", status: .selecionado),
        HorarioQuadra(hora: "11:00", status: .selecionado),
        HorarioQuadra(hora: "12:00", status: .selecionado),
        HorarioQuadra(hora: "13:00", status: .disponivel),
        HorarioQuadra(hora: "14:00", status: .reservado),
        HorarioQuadra(hora: "15:00", status: .disponivel),
        HorarioQuadra(hora: "16:00", status: .disponivel),
        HorarioQuadra(hora: "17:00", status: .disponivel),
        HorarioQuadra(hora: "18:00", status: .disponivel),
        HorarioQuadra(hora: "19:00", status: .disponivel),
        HorarioQuadra(hora: "20:00", status: .disponivel),
        HorarioQuadra(hora: "21:00", status: .disponivel),
        HorarioQuadra(hora: "22:00", status: .disponivel),
        HorarioQuadra(hora: "23:00", status: .disponivel)
    ]
    
    let colunas = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {

            VStack(spacing: 0) {
                
                // --- CABEÇALHO CUSTOMIZADO ---
                VStack(spacing: 0) {
                    HStack {
                        // BOTÃO DE VOLTAR IMPLEMENTADO AQUI
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            Image(systemName: "chevron.left")
                                .font(.title2)
                                .foregroundColor(verdeEscuro)
                        }
                        
                        Spacer()
                        
                        Text("Agendar horário")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(verdeEscuro)
                        
                        Spacer()
                        
                        Image(systemName: "rectangle.portrait.and.arrow.right")
                            .foregroundColor(verdeEscuro)
                    }
                    .padding(.horizontal)
                    .padding(.top, 50)
                    .padding(.bottom, 15)
                    
                    Divider()
                }
                .background(Color.white)

                // --- SELETOR DE DATA ---
                VStack {
                    Button(action: {
                        withAnimation { mostrarCalendario.toggle() }
                    }) {
                        HStack {
                            Text(dataSelecionada, formatter: itemFormatter)
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(verdeEscuro)
                            Spacer()
                            Image(systemName: "calendar")
                                .foregroundColor(verdeEscuro)
                                .font(.title2)
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(8)
                        .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray.opacity(0.3), lineWidth: 1))
                    }
                    .padding([.horizontal, .top])
                    
                    if mostrarCalendario {
                        DatePicker("", selection: $dataSelecionada, displayedComponents: [.date])
                            .datePickerStyle(.graphical)
                            .accentColor(verdeEscuro)
                            .padding()
                            .background(Color.white)
                    }
                }

                Text("Selecionar horário")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(verdeEscuro)
                    .padding(.vertical, 10)
                
                // --- GRADE DE HORÁRIOS ---
                ScrollView {
                    LazyVGrid(columns: colunas, spacing: 15) {
                        ForEach($horarios) { $horario in
                            BotaoHorario(horario: $horario,
                                         corDisponivel: verdeEscuro,
                                         corSelecionado: verdeClaro,
                                         corReservado: vermelho)
                        }
                    }
                    .padding()
                }
                
                // --- RODAPÉ ---
                VStack {
                    Divider()
                    Text("Horário Selecionado: \(horariosSelecionadosTexto())")
                        .font(.caption)
                        .fontWeight(.bold)
                        .padding(.vertical, 5)
                    Divider()
                    
                    NavigationLink(destination: TelaConfirmacao(horariosConfirmados: horarios.filter({ $0.status == .selecionado }))) {
                        Text("Confirmar")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(verdeEscuro)
                            .cornerRadius(10)
                    }
                    .padding([.horizontal, .bottom])
                }
                .background(Color.white)
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .edgesIgnoringSafeArea(.top)
        }
    
    
    func horariosSelecionadosTexto() -> String {
        let selecionados = horarios.filter { $0.status == .selecionado }
        return selecionados.isEmpty ? "Nenhum" : selecionados.map { $0.hora }.joined(separator: ", ")
    }
}

// --- COMPONENTES AUXILIARES ---

struct BotaoHorario: View {
    @Binding var horario: HorarioQuadra
    var corDisponivel: Color
    var corSelecionado: Color
    var corReservado: Color
    
    var body: some View {
        Button(action: {
            if horario.status == .disponivel {
                horario.status = .selecionado
            } else if horario.status == .selecionado {
                horario.status = .disponivel
            }
        }) {
            VStack {
                Text(horario.hora)
                    .fontWeight(.bold)
                Text(horario.status == .reservado ? "Reservado" : "Disponível")
                    .font(.caption)
            }
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 12)
            .background(horario.status == .disponivel ? corDisponivel : (horario.status == .selecionado ? corSelecionado : corReservado))
            .cornerRadius(8)
        }
        .disabled(horario.status == .reservado)
    }
}

// --- FORMATADOR DE DATA ---
private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "dd 'de' MMMM"
    formatter.locale = Locale(identifier: "pt_BR")
    return formatter
}()

struct TelaUsuario_Previews: PreviewProvider {
    static var previews: some View {
        TelaUsuario()
    }
}
