import SwiftUI

struct TipoInterdicaoView: View {
    // Controla o que aparece na caixa "motivo da interdição"
    @State private var motivoSelecionado: String = ""
    @State private var isNavigating = false
    
    // Variáveis que serão passadas para a tela de confirmação
    @State var quadraSelecionada: String
    @State var dataInicio: String
    @State var horarioInicio: String
    @State var dataFim: String
    @State var horarioFim: String
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
            VStack(spacing: 0) {
                HStack {
                    Spacer()
                    Button(action: {
                        
                    }) {
                        Image(systemName: "rectangle.portrait.and.arrow.right")
                            .resizable().scaledToFit().frame(width: 22, height: 22).foregroundColor(.white)
                    }
                }
                .padding(.horizontal).padding(.vertical, 10).background(Color.ascijaVerdeEscuro)
                
                ZStack {
                    Text("Tipo de interdição")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.ascijaVerdeEscuro)
                    HStack {
                        Button(action: {
                            // Agora este botão fecha esta tela e volta para a tela de Tipos de Espaço
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            Image(systemName: "chevron.left")
                                .font(.title3)
                                .foregroundColor(Color.ascijaVerdeEscuro)
                        }
                        Spacer()
                    }
                }
                .padding(.horizontal)
                .padding(.vertical, 16)
                
                Divider()
                
                HStack {
                    Text(motivoSelecionado.isEmpty ? "motivo da interdição" : motivoSelecionado)
                        .foregroundColor(motivoSelecionado.isEmpty ? .gray.opacity(0.6) : .black)
                        .font(.system(size: 18))
                    Spacer()
                }
                .padding()
                .frame(height: 56)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.ascijaBorda, lineWidth: 1)
                )
                .padding(.horizontal)
                .padding(.top, 24)
                
                // Botões de Seleção
                VStack(spacing: 16) {
                    Button("Manutenção") {
                        motivoSelecionado = "Manutenção"
                    }
                    .buttonStyle(BotaoOpcaoStyle())
                    
                    Button("Evento") {
                        motivoSelecionado = "Evento"
                    }
                    .buttonStyle(BotaoOpcaoStyle())
                    
                    Button("Outro") {
                        motivoSelecionado = "Outro"
                    }
                    .buttonStyle(BotaoOpcaoStyle())
                }
                .padding(.horizontal)
                .padding(.top, 24)
                
                Spacer()
                
                Divider()
                
                // Link de Navegação
                NavigationLink(
                    destination: ConfirmacaoInterditacaoView(
                        quadra: quadraSelecionada,
                        dataInicio: dataInicio,
                        horarioInicio: horarioInicio,
                        dataFim: dataFim,
                        horarioFim: horarioFim
                    ),
                    isActive: $isNavigating
                ) {
                    EmptyView()
                }
                
                // Botão Confirmar
                Button("Confirmar") {
                    // Opcional: Adicionar uma validação para só deixar avançar se escolheu um motivo
                    if !motivoSelecionado.isEmpty {
                        isNavigating = true
                    }
                }
                .buttonStyle(BotaoConfirmarStyle())
                .padding(.horizontal)
                .padding(.vertical, 16)
            }
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
    }



