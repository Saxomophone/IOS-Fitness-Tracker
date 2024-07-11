import SwiftUI

enum ActiveView {
    case loading, login, signup, home, exercise // Added exercise case
}

class ViewManager: ObservableObject {
    @Published var activeView: ActiveView = .loading
}

struct ContentView: View {
    @StateObject var viewManager = ViewManager()

    var body: some View {
        switch viewManager.activeView {
        case .loading:
            LoadingScreenView()
                .environmentObject(viewManager)
        case .login:
            LoginPageView()
                .environmentObject(viewManager)
        case .signup:
            SignupView()
                .environmentObject(viewManager)
        case .home:
            HomeView()
                .environmentObject(viewManager)
        case .exercise: // Added case for exercise
            ExerciseView()
                .environmentObject(ExerciseViewManager()) // Initialize ExerciseViewManager here
                .environmentObject(viewManager)
        }
    }
}

#Preview {
    ContentView()
}
