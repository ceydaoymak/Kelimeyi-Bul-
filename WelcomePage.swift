//
//  WelcomePage.swift
//  Kelimeyi Bul
//
//  Created by ceyda oymak on 5.02.2025.
//

import SwiftUI

struct WelcomePage: View {
    var body: some View {
        ZStack{
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(hue: 0.619, saturation: 0.887, brightness: 0.566, opacity: 1) ,                      Color(hue: 0.0, saturation: 0.0, brightness: 0.85, opacity: 0.5),                        Color(hue: 0.619, saturation: 0.887, brightness: 0.566, opacity: 0.9)
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            HStack(spacing:5){
                letterCircle(letter: "K").offset(y: 10)
                      letterCircle(letter: "E").offset(y: 0)
                      letterCircle(letter: "L").offset(y: 10)
                      letterCircle(letter: "İ").offset(y: 0)
                      letterCircle(letter: "M").offset(y: 10)
                      letterCircle(letter: "E").offset(y: 0)
                      letterCircle(letter: "Y").offset(y: 10)
                      letterCircle(letter: "İ").offset(y: 0)
            }.padding(.bottom,500)
                 
            HStack(spacing:5){
                letterCircle(letter: "B").offset(y: 0)
                      letterCircle(letter: "U").offset(y: 5)
                      letterCircle(letter: "L").offset(y: 0)
            }.padding(.bottom,350)
                
            VStack(spacing:30){
                buttons(title: "4 harfliler")
                buttons(title: "5 harfliler")
                buttons(title: "6 harfliler")
            
              
                
            }
            .padding(.top, 200)
        }.ignoresSafeArea()
        
    }
}
struct letterCircle: View {
    var letter: String
    
    var body: some View{
        Circle()
            .fill(Color.white.opacity(0.7))
            .frame(width:40,height:50)
            .overlay(Text(letter)
                .font(.custom("Noteworthy-Bold", size: 30))
                .fontWeight(.heavy)
                .bold()
                .foregroundColor(.black))
            
    }
}
struct buttons:View{
    var title: String
    var body:some View{
        Button (title){
            
        }
        .padding()
        .frame(width: 290.0, height: 100.0)
        .background(Color(hue: 0.619, saturation: 0.887, brightness: 0.566, opacity: 0.711))                .foregroundColor(.white)
        .font(.custom("ArialRoundedMTBold",size: 30))
        .shadow(color: Color.black.opacity(0.7), radius: 10, x: 5, y: 5)
        .cornerRadius(20)
        
    }
}

struct WelcomePage_Previews: PreviewProvider {
    static var previews: some View {
        WelcomePage()
    }
}
