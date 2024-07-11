// SignupView.swift
import SwiftUI

struct SignupView: View {
    @EnvironmentObject var viewManager: ViewManager

    var body: some View {
        VStack {
            Text("Signup")
            Button("Go to Home") {
                viewManager.activeView = .home
            }
        }
    }
}

#Preview {
    SignupView()
        .environmentObject(ViewManager())
}
