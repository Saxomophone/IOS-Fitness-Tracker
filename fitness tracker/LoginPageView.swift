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
                    .autocorrectionDisabled(true)
                    .autocapitalization(.none)
                
                ZStack(alignment: .trailing) {
                    Group {
                        if isSecure {
                            SecureField("Password", text: $password)
                                .padding(.trailing, 30)
                                .autocorrectionDisabled(true)
                                .autocapitalization(.none)
                        } else {
                            TextField("Password", text: $password)
                                .padding(.trailing, 30)
                                .autocorrectionDisabled(true)
                                .autocapitalization(.none)
                        }
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(5.0)
                    .padding(.bottom, 20)
                    .frame(maxWidth: .infinity)
                    
                    Button(action: {
                        isSecure.toggle()
                    }) {
                        Image(systemName: isSecure ? "eye" : "eye.slash")
                            .foregroundColor(.gray)
                            .padding([.bottom, .trailing])
                            .frame(width: 44, height: 44) // Fixed size to avoid layout shift
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
