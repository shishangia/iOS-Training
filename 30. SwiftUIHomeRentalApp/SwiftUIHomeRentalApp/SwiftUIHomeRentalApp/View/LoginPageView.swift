//
//  LoginPageView.swift
//  SwiftUIHomeRentalApp
//
//  Created by Shivam Shishangia on 08/07/24.
//

import SwiftUI

struct LoginPageView: View {
    var body: some View {
        VStack {
            HStack {
                Spacer()
                
                Image("dubizzle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 100)
                    .padding(.leading, 30)
                
                Spacer()
                
                Image(systemName: "xmark")
                
            }
            .padding(.horizontal)
            
            Image("LoginPage")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
            
            LoginButtonView(text: "Facebook", image: "Facebook") {
                print("Login with Facebook tapped")
            }
            .padding(.bottom, 5)
            
            LoginButtonView(text: "Google", image: "Google") {
                print("Login with Google tapped")
            }
            .padding(.bottom, 5)
            
            LoginButtonView(text: "Apple", image: "AppleLogo") {
                print("Login with Apple tapped")
            }
            .padding(.bottom, 5)
            
            LoginButtonView(text: "Email") {
                print("Login with Email tapped")
            }
            .padding(.bottom, 5)
            
            Text("Don't have an account? Create one")
                .font(.headline)
                .foregroundColor(.red)
                .padding()
            
            Text("By logging in, I agree to the \(Text("Terms and conditions").foregroundColor(.blue)) and \(Text("Privacy Policy").foregroundColor(.blue))")
                .foregroundColor(.gray)
                .font(.footnote)
                .multilineTextAlignment(.center)
            
            Spacer()
        }
        .padding()
    }
}

struct LoginPageView_Previews: PreviewProvider {
    static var previews: some View {
        LoginPageView()
    }
}
