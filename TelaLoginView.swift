import SwiftUI

struct TelaLoginView: View {
    @State private var mostrandoAdmin: Bool = false
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            
            if mostrandoAdmin {
                LoginAdminView(comandoDeSaida: {
                    withAnimation(.easeInOut(duration: 0.4)) {
                        mostrandoAdmin = false
                    }
                })
                .transition(.opacity)
                
            } else {
                LoginUsuarioView(comandoDeIrParaAdmin: {
                    withAnimation(.easeInOut(duration: 0.4)) {
                        mostrandoAdmin = true
                    }
                })
                .transition(.opacity)
            }
        }
    }
}

struct TelaLoginView_Previews: PreviewProvider {
    static var previews: some View {
        TelaLoginView()
    }
}
