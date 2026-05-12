import SwiftUI

// 1. Modelo de Dados para popular a lista dinamicamente
struct SpaceModel: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String // Nome da imagem nos seus Assets
}

// 2. Componente do Cartão (CardView)
struct SpaceCardView: View {
    let space: SpaceModel
    
    var body: some View {
        ZStack(alignment: .bottom) {
            // Substitua "CourtImagePlaceholder" pelo nome real da sua imagem nos Assets
            Image(space.imageName)
                .resizable()
                .scaledToFill()
                .frame(height: 120)
                .clipped()
            
            // Fundo escuro com o texto sobreposto à imagem
            Text(space.name)
                .font(.system(size: 18, weight: .regular, design: .serif))
                .foregroundColor(.white)
                .padding(.vertical, 4)
                .padding(.horizontal, 12)
                .background(Color.black.opacity(0.7))
                .padding(.bottom, 8)
        }
        .frame(height: 120) // Altura fixa do cartão
        .cornerRadius(10)   // Bordas arredondadas
        .overlay(           // Borda preta em volta do cartão
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.black, lineWidth: 2)
        )
        .padding(.horizontal)
        .padding(.vertical, 6)
    }
}

// 3. Tela Principal
struct SelectSpaceView: View {
    
    // Cor verde escura personalizada da sua interface
    let darkGreen = Color(red: 0.12, green: 0.29, blue: 0.16)
    
    // Lista de quadras (Dados mockados para a UI)
    let spaces = [
        SpaceModel(name: "Quadra De Tênis 1", imageName: "tennisCourt"),
        SpaceModel(name: "Quadra De Tênis 2", imageName: "tennisCourt"),
        SpaceModel(name: "Quadra De Tênis 3", imageName: "tennisCourt"),
        SpaceModel(name: "Quadra De Tênis 4", imageName: "tennisCourt"),
        SpaceModel(name: "Quadra De Tênis 5", imageName: "tennisCourt")
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            
            // --- Barra Superior (Header Escuro) ---
            HStack {
                Spacer()
                Button(action: {
                    // Ação do botão de sair
                }) {
                    Image(systemName: "door.right.hand.open")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                        .foregroundColor(.white)
                }
            }
            .padding()
            .background(darkGreen)
            
            // --- Área de Título ---
            HStack {
                Button(action: {
                    // Ação de voltar
                }) {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                        .foregroundColor(darkGreen)
                }
                
                Text("Selecionar espaço")
                    .font(.custom("Georgia-Bold", size: 28)) // Fonte serifada semelhante à da imagem
                    .foregroundColor(darkGreen)
                
                Spacer()
            }
            .padding(.horizontal)
            .padding(.vertical, 12)
            
            // Linha verde separadora
            Rectangle()
                .fill(darkGreen)
                .frame(height: 2)
            
            // --- Lista de Quadras ---
            ScrollView {
                VStack(spacing: 10) {
                    ForEach(spaces) { space in
                        // Ação ao clicar na quadra pode ser envolvida em um NavigationLink ou Button
                        SpaceCardView(space: space)
                    }
                }
                .padding(.top, 16)
            }
        }
        .edgesIgnoringSafeArea(.top) // Faz a barra verde encostar no topo do iPhone
    }
}

// Preview para o Xcode
struct SelectSpaceView_Previews: PreviewProvider {
    static var previews: some View {
        SelectSpaceView()
    }
}
