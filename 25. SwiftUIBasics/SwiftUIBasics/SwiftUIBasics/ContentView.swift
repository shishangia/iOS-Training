//
//  ContentView.swift
//  SwiftUIBasics
//
//  Created by Shivam Shishangia on 27/06/24.
//

import SwiftUI

struct ContentView: View {
    
    var data = ["Hello", "Hola", "Hi"]

    var body: some View {
//        ZStack {
//            Rectangle()
//                .fill(Color.red)
//                .frame(width: 200, height: 200)
//                .cornerRadius(25)
//
//            Text("Shivam")
//                .font(.system(size: 24))
//                .background(Color.black)
//                .foregroundStyle(Color.red)
//                .cornerRadius(10)
//                .padding(.horizontal)
//        }
        
//        VStack {
//            ZStack {
//                Rectangle()
//                    .fill(Color.black)
//                    .frame(width: 200, height: 200)
//                    .cornerRadius(10)
//                
//                Image(systemName: "gear")
//                    .foregroundColor(Color.white)
//            }
//            
//            Spacer()
//
//            ZStack {
//                Circle()
//                    .fill(Color.black)
//                    .frame(width: 200, height: 200)
//                    .cornerRadius(10)
//                
//                Image(systemName: "gear")
//                    .foregroundColor(Color.white)
//            }
//            
//            Spacer()
//
//            ZStack {
//                Rectangle()
//                    .fill(Color.black)
//                    .frame(width: 200, height: 200)
//                    .cornerRadius(10)
//                
//                Image(systemName: "gear")
//                    .foregroundColor(Color.white)
//            }
//
//        }

//        VStack(spacing: 10) {
//            ForEach(data.indices) { index in
//                ZStack {
//                    Rectangle()
//                        .fill(Color.black)
//                        .frame(width: 200, height: 200)
//                        .cornerRadius(25)
//                    
//                    Text("\(index+1): \(data[index])")
//                        .font(.largeTitle)
//                        .background(Color.yellow)
//                        .foregroundStyle(Color.black)
//                        .cornerRadius(10)
//                }
//            }
//        }
        
        VStack() {
            ForEach(0..<3) { _ in
                Spacer()
                HStack(spacing: 10) {
                    ForEach(0..<3) { _ in
                        Spacer()
                        
                        Text("Swift-UI")
                            .font(.system(size: 16))
                            .foregroundStyle(Color.red)
                        
                        Spacer()
                    }
                }
            }
            Spacer()
        }
        .padding(.bottom, 50)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
