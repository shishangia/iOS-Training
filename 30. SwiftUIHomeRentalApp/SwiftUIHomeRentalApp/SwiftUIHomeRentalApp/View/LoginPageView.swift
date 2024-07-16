//
//  LoginPageView.swift
//  SwiftUIHomeRentalApp
//
//  Created by Shivam Shishangia on 08/07/24.
//

import SwiftUI

struct LoginPageView: View {

    var body: some View {
        NavigationView {
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
                
                LoginOptionView(text: "Facebook", image: "Facebook")
                    .padding(.bottom, 5)
                
                LoginOptionView(text: "Google", image: "Google")
                    .padding(.bottom, 5)
                
                LoginOptionView(text: "Apple", image: "AppleLogo")
                    .padding(.bottom, 5)
                
                NavigationLink(destination: EmailLoginView()) {
                    LoginOptionView(text: "Email")
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
}

struct LoginPageView_Previews: PreviewProvider {
    static var previews: some View {
        LoginPageView()
    }
}
