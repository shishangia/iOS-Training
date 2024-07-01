//
//  ContentView.swift
//  SwiftUILoginScreen
//
//  Created by Shivam Shishangia on 01/07/24.
//

import SwiftUI

struct ContentView: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var phone: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""

    var body: some View {
        VStack {

            Text("Let's Get Started!")
                .font(.title)
                .fontWeight(.bold)
                .padding(.top, 50)
            
            Text("Create an account to Q Allure to get all features")
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.bottom, 20)
            
            VStack(alignment: .leading, spacing: 20) {
                InputTextFieldWithImage(imageName: "person.fill", placeholderText: "Name", text: $name)
                InputTextFieldWithImage(imageName: "envelope.fill", placeholderText: "Email", text: $email)
                InputTextFieldWithImage(imageName: "phone.fill", placeholderText: "Phone", text: $phone)
                InputTextFieldWithImage(imageName: "lock.fill", placeholderText: "Password", text: $password, isSecure: true)
                InputTextFieldWithImage(imageName: "lock.fill", placeholderText: "Confirm Password", text: $confirmPassword, isSecure: true)
            }
            
            Button(action: {
                print("Create button tapped")
            }) {
                Text("CREATE")
                    .foregroundColor(.white)
                    .frame(width: 120)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding(.top, 30)
            
            Spacer()

            HStack {
                Text("Already have an account?")

                Button(action: {
                    print("Login button tapped")
                }) {
                    Text("Login here")
                        .foregroundColor(.blue)
                }
            }
            .padding(.bottom, 20)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
