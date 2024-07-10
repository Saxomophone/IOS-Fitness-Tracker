import SwiftUI

struct LoginPageView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isSecure: Bool = true
    @State private var validLogin: Bool = false
    @EnvironmentObject var viewManager: ViewManager

    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                Text("Login")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Spacer()
                
                TextField("Email", text: $email)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(5.0)
                    .padding(.bottom, 20)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                
                ZStack(alignment: .trailing) {
                    if isSecure {
                        SecureField("Password", text: $password)
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(5.0)
                            .padding(.bottom, 20)
                    } else {
                        TextField("Password", text: $password)
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(5.0)
                            .padding(.bottom, 20)
                    }
                    
                    Button(action: {
                        isSecure.toggle()
                    }) {
                        Image(systemName: isSecure ? "eye" : "eye.slash")
                            .foregroundColor(.gray)
                            .padding([.bottom, .trailing])
                    }
                    .buttonStyle(PlainButtonStyle()) // Prevent fading to white when clicked
                }
                
                Button(action: {
                    // Handle login action
                    // For demo purposes, we assume login is always successful
                    validLogin = true
                    if validLogin {
                        viewManager.activeView = .home
                    }
                }) {
                    Text("Login")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 220, height: 60)
                        .background(Color.blue)
                        .cornerRadius(15.0)
                }
                .padding(.top, 20)
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    LoginPageView()
}
