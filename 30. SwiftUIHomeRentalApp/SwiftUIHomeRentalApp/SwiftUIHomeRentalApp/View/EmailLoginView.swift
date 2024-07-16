//
//  EmailLoginView.swift
//  SwiftUIHomeRentalApp
//
//  Created by Shivam Shishangia on 09/07/24.
//

import SwiftUI

struct EmailLoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""

    var body: some View {
        VStack {
            TextField("Email", text: $email)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.emailAddress)
                .textContentType(.emailAddress)
            
            SecureField("Password", text: $password)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            NavigationLink(destination: EmailDetailsView(email: email, password: password)) {
                Text("Login")
                    .padding()
                    .frame(minWidth: 150)
                    .background(.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .navigationBarTitle("Login with Email")
    }
}

struct EmailLoginView_Previews: PreviewProvider {
    static var previews: some View {
        EmailLoginView()
    }
}
