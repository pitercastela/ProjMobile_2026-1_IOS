import SwiftUI

struct LoginUsuarioView: View {
    @State private var nomeUsuario: String = ""
    @State private var senha: String = ""
    
    var comandoDeIrParaAdmin: () -> Void
    
    var body: some View {
        // 1. O NavigationView agora é o dono de todo o fluxo do app
        NavigationView {
            VStack(spacing: 20) {
                Spacer()
                
                Image("logo_ascija")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250)
                    .padding(.bottom, 30)
                
                VStack(spacing: 15) {
                    TextField("Nome de Usuário", text: $nomeUsuario)
                        .font(Font.system(size: 16, design: .serif))
                        .padding()
                        .background(Color.white)
                        .cornerRadius(8)
                        .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.ascijaBorda, lineWidth: 1))
                    
                    SecureField("Senha", text: $senha)
                        .font(Font.system(size: 16, design: .serif))
                        .padding()
                        .background(Color.white)
                        .cornerRadius(8)
                        .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.ascijaBorda, lineWidth: 1))
                }
                .padding(.horizontal, 40)
                
                NavigationLink(destination: HomeUsuarioView()) {
                    Text("Entrar")
                        .font(Font.system(size: 20, weight: .bold, design: .serif))
                        .foregroundColor(.white)
                        .frame(width: 160, height: 45)
                        .background(Color.ascijaVerdeEscuro)
                        .cornerRadius(8)
                }
                .padding(.top, 15)
                
                Button(action: {
                    comandoDeIrParaAdmin()
                }) {
                    Text("logar como admin")
                        .font(Font.system(size: 14, design: .serif))
                        .foregroundColor(.gray)
                }
                
                Spacer()
            }
            .background(Color.white)
            // 2. Esconde a barra de navegação no topo da própria tela de Login
            .navigationBarHidden(true)
        }
        // 3. Boa prática: Força o estilo de pilha, evitando bugs visuais caso o usuário abra no iPad ou iPhone Max deitado
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
