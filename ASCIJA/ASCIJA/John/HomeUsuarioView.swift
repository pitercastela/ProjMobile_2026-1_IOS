import SwiftUI

struct HomeUsuarioView: View {
    let verdeEscuro = Color(red: 0.11, green: 0.27, blue: 0.16)
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Spacer()
                Button(action: {
                    // Ação de sair
                }) {
                    Image(systemName: "rectangle.portrait.and.arrow.right")
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding()
                }
            }
            .background(verdeEscuro)
            
            VStack {
                Image("logo_ascija")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 80)
                    .padding(.vertical, 15)
                
                Divider()
            }
            .background(Color.white)
            
            VStack(spacing: 15) {
                Button(action: {
                    // Ação de Reservar
                }) {
                    HStack {
                        Image(systemName: "calendar")
                            .font(.system(size: 28))
                        Text("Reservar quadra")
                            .font(.system(size: 22, design: .serif))
                    }
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 15)
                    .background(verdeEscuro)
                    .cornerRadius(8)
                }
                
                Button(action: {
                    // Ação de Minhas Reservas
                }) {
                    HStack {
                        Image(systemName: "list.bullet")
                            .font(.system(size: 28))
                        Text("Minhas reservas")
                            .font(.system(size: 22, design: .serif))
                    }
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 15)
                    .background(verdeEscuro)
                    .cornerRadius(8)
                }
            }
            .padding(20)
            
            Divider()
            
            VStack(spacing: 15) {
                Text("Próxima reserva")
                    .font(.system(size: 24, weight: .black, design: .serif))
                    .foregroundColor(verdeEscuro)
                    .padding(.top, 15)
                
                VStack {
                    Text("Nenhuma reserva")
                        .underline()
                    Text("encontrada")
                        .underline()
                }
                .font(.system(size: 18, weight: .bold, design: .serif))
                .foregroundColor(Color(red: 0.0, green: 0.4, blue: 0.8))
                .frame(maxWidth: .infinity)
                .frame(height: 120)
                .background(Color.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(Color.gray.opacity(0.6), lineWidth: 1)
                )
                .padding(.horizontal, 20)
            }
            
            Spacer()
            
        }
        .edgesIgnoringSafeArea(.top)
        .background(Color.white)
    }
}

struct HomeUsuarioPreview_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
