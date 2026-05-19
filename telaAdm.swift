import SwiftUI

// 1. Modelo de Dados Simplificado
struct HorarioRestricao: Identifiable {
    let id = UUID()
    let hora: String
    let isReservado: Bool
}

// 2. A Tela Reutilizável (Serve tanto para Início quanto para Fim)
struct TelaRestricaoADM: View {
    var isFim: Bool
    
    var dataInicio: Date?
    var horaInicio: String?
    
    let verdeEscuro = Color(red: 22/255, green: 73/255, blue: 43/255)
    let verdeClaro = Color(red: 104/255, green: 139/255, blue: 115/255)
    let vermelho = Color(red: 139/255, green: 26/255, blue: 26/255)
    
    @State private var dataSelecionada = Date()
    @State private var mostrarCalendario = false
    @State private var horaSelecionada: String? = nil
    
    @Environment(\.presentationMode) var presentationMode
    
    let horarios: [HorarioRestricao] = [
        HorarioRestricao(hora: "6:00", isReservado: false),
        HorarioRestricao(hora: "7:00", isReservado: false),
        HorarioRestricao(hora: "8:00", isReservado: false),
        HorarioRestricao(hora: "9:00", isReservado: false),
        HorarioRestricao(hora: "10:00", isReservado: false),
        HorarioRestricao(hora: "11:00", isReservado: false),
        HorarioRestricao(hora: "12:00", isReservado: false),
        HorarioRestricao(hora: "13:00", isReservado: false),
        HorarioRestricao(hora: "14:00", isReservado: false),
        HorarioRestricao(hora: "15:00", isReservado: false),
        HorarioRestricao(hora: "16:00", isReservado: false),
        HorarioRestricao(hora: "17:00", isReservado: false),
        HorarioRestricao(hora: "18:00", isReservado: false),
        HorarioRestricao(hora: "19:00", isReservado: false),
        HorarioRestricao(hora: "20:00", isReservado: false),
        HorarioRestricao(hora: "21:00", isReservado: false),
        HorarioRestricao(hora: "22:00", isReservado: false),
        HorarioRestricao(hora: "23:00", isReservado: false)
    ]
    
    let colunas = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        Group {
            if !isFim {
                NavigationView { conteudoPrincipal }
            } else {
                conteudoPrincipal
            }
        }
    }
    
    var conteudoPrincipal: some View {
        VStack(spacing: 0) {
            
            // --- CABEÇALHO ---
            VStack(spacing: 0) {
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.title2)
                            .foregroundColor(verdeEscuro)
                    }
                    
                    Spacer()
                    
                    Text(isFim ? "Horário fim" : "Horário início")
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

            // --- CALENDÁRIO ---
            VStack {
                Button(action: {
                    withAnimation { mostrarCalendario.toggle() }
                }) {
                    HStack {
                        Text(dataSelecionada, formatter: itemFormatter)
                            .font(.title3).fontWeight(.bold).foregroundColor(verdeEscuro)
                        Spacer()
                        Image(systemName: "calendar").foregroundColor(verdeEscuro).font(.title2)
                    }
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray.opacity(0.3), lineWidth: 1))
                }
                .padding([.horizontal, .top])
                
                if mostrarCalendario {
                    DatePicker("", selection: $dataSelecionada, displayedComponents: [.date])
                        .datePickerStyle(.graphical)
                        .accentColor(verdeEscuro)
                        .padding()
                }
            }

            Text("Selecionar horário")
                .font(.title3).fontWeight(.bold).foregroundColor(verdeEscuro)
                .padding(.vertical, 10)
            
            // --- GRID DE HORÁRIOS ---
            ScrollView {
                LazyVGrid(columns: colunas, spacing: 15) {
                    ForEach(horarios) { horario in
                        Button(action: {
                            if !horario.isReservado {
                                horaSelecionada = horario.hora
                            }
                        }) {
                            VStack {
                                Text(horario.hora).fontWeight(.bold)
                                Text(horario.isReservado ? "Reservado" : (horaSelecionada == horario.hora ? "Selecionado" : "Disponível"))
                                    .font(.caption)
                            }
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 12)
                            .background(horario.isReservado ? vermelho : (horaSelecionada == horario.hora ? verdeClaro : verdeEscuro))
                            .cornerRadius(8)
                        }
                        .disabled(horario.isReservado)
                    }
                }
                .padding()
            }
            
            // --- RODAPÉ DINÂMICO ---
            VStack {
                Divider()
                Text("Horário Selecionado: \(textoRodape())")
                    .font(.caption)
                    .fontWeight(.bold)
                    .padding(.vertical, 5)
                Divider()
                
                if isFim {
                    // MUDANÇA: Agora leva para uma tela provisória em texto.
                    // Quando o seu colega terminar a tela dele, substitua a View 'Text(...)'
                    // abaixo pelo nome da struct que ele criou.
                    NavigationLink(destination: Text("Ainda não tem (é a tela do Rodrigo)").font(.title2).foregroundColor(.gray)) {
                        botaoConfirmarVisual
                    }
                    .disabled(horaSelecionada == nil)
                } else {
                    NavigationLink(destination: TelaRestricaoADM(
                        isFim: true,
                        dataInicio: dataSelecionada,
                        horaInicio: horaSelecionada
                    )) {
                        botaoConfirmarVisual
                    }
                    .disabled(horaSelecionada == nil)
                }
            }
            .background(Color.white)
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .edgesIgnoringSafeArea(.top)
    }
    
    var botaoConfirmarVisual: some View {
        Text("Confirmar")
            .font(.title3)
            .fontWeight(.bold)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .padding()
            .background(horaSelecionada == nil ? Color.gray : verdeEscuro)
            .cornerRadius(10)
            .padding([.horizontal, .bottom])
    }
    
    func textoRodape() -> String {
        if isFim {
            guard let dInicio = dataInicio, let hInicio = horaInicio, let hFim = horaSelecionada else {
                return "Aguardando seleção..."
            }
            let strInicio = shortFormatter.string(from: dInicio)
            let strFim = shortFormatter.string(from: dataSelecionada)
            return "(\(strInicio)) \(hInicio) - (\(strFim)) \(hFim)"
        } else {
            return horaSelecionada ?? "Nenhum"
        }
    }
}

// 3. Formatadores de Data Globais (Não apague, ou o texto e calendário dão erro)
private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "dd 'de' MMMM"
    formatter.locale = Locale(identifier: "pt_BR")
    return formatter
}()

private let shortFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "dd/MM"
    return formatter
}()


