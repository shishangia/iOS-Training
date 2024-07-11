//
//  EmailDetailsView.swift
//  SwiftUIHomeRentalApp
//
//  Created by Shivam Shishangia on 09/07/24.
//

import SwiftUI

struct EmailDetailsView: View {
    var email: String
    var password: String

    var body: some View {
        VStack {
            Text("Email: \(email)")
                .font(.headline)
                .padding(.horizontal)
            
            Text("Password: \(password)")
                .font(.headline)
                .padding(.horizontal)
        }
        .navigationBarTitle("Details")
    }
}

struct EmailDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        EmailDetailsView(email: "test@gmail.com", password: "12345")
    }
}
