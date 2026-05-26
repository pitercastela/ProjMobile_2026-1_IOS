import SwiftUI

struct LoginAdminView: View {
    @State private var nomeAdmin: String = ""
    @State private var senhaAdmin: String = ""
    
    var comandoDeSaida: () -> Void
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            
            Image("logo_ascija")
                .resizable()
                .scaledToFit()
                .frame(width: 250)
                .padding(.bottom, 30)
            
            VStack(spacing: 15) {
                TextField("Nome de Admin", text: $nomeAdmin)
                    .font(Font.system(size: 16, design: .serif))
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.ascijaBorda, lineWidth: 1))
                
                SecureField("Senha", text: $senhaAdmin)
                    .font(Font.system(size: 16, design: .serif))
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.ascijaBorda, lineWidth: 1))
            }
            .padding(.horizontal, 40)
            
            Button(action: { print("Login Admin!") }) {
                Text("Entrar")
                    .font(Font.system(size: 20, weight: .bold, design: .serif))
                    .foregroundColor(.white)
                    .frame(width: 160, height: 45)
                    .background(Color.ascijaVerdeEscuro)
                    .cornerRadius(8)
            }
            .padding(.top, 15)
            
            Button(action: {
                comandoDeSaida()
            }) {
                Text("logar como usuário")
                    .font(Font.system(size: 14, design: .serif))
                    .foregroundColor(.gray)
            }
            
            Spacer()
        }
        .background(Color.white)
    }
}

struct LoginAdminView_Previews: PreviewProvider {
    static var previews: some View {
        LoginAdminView(comandoDeSaida: {})
    }
}
