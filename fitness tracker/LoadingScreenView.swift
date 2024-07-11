import SwiftUI

struct LoadingScreenView: View {
    @State private var isActive = true
    @State private var icon = "figure.run"
    @State private var scaleEffect: CGFloat = 1.0
    @State private var isCircleVisible = false
    @EnvironmentObject var viewManager: ViewManager

    var body: some View {
        ZStack {
            if isActive {
                Color(.black)
                    .ignoresSafeArea()
                VStack {
                    ZStack {
                        // Person icon
                        Image(systemName: "figure.run")
                            .font(.system(size: 80)) // Smaller size
                            .foregroundStyle(.mint)
                            .scaleEffect(scaleEffect)

                        // Circle
                        Image(systemName: "circle")
                            .font(.system(size: 100)) // Smaller size
                            .foregroundStyle(.mint)
                            .opacity(isCircleVisible ? 1 : 0)
                    }
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                            withAnimation(.easeInOut(duration: 1.0)) {
                                self.isCircleVisible = true
                            }
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                            withAnimation(.easeInOut(duration: 1.0)) {
                                self.scaleEffect = 0.6
                            }
                        }
                    }
                    Text("Fitness Tracker")
                        .font(Font.custom("Baskerville-Bold", size: 30))
                        .foregroundStyle(.white)
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
                        withAnimation(.easeOut(duration: 0.7)) {
                            self.isActive = false
                        }
                    }
                }
            } else {
                Color.clear // Use a clear color or any placeholder view
                    .onAppear {
                        viewManager.activeView = .login
                    }
            }
        }
    }
}

#Preview {
    LoadingScreenView()
        .environmentObject(ViewManager())
}
