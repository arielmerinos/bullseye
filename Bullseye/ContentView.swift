//
//  ContentView.swift
//  Bullseye
//
//  Created by Ariel Merino on 30/12/23.
//

import SwiftUI

struct ContentView: View {
  
  @State private var bullseyeValue: Double = 50.0
  @State private var alertIsVisible: Bool = false
  @State private var randomEye: Int = Int.random(in: 1...100)
  
  
  var body: some View {
    VStack{
      Text("🎯🎯🎯")
        .font(Font.system(size: 78, weight: .black))
        .padding(.bottom)
      Text("PUT THE BULLSEYE AS CLOSE AS YOU CAN TO")
      .fontWeight(.bold)
      .multilineTextAlignment(.center)
      .lineSpacing(6)
      .kerning(2.0)
      Text("89")
        .font(.largeTitle)
        .fontWeight(.heavy)
      HStack{
        Text("1")
          .font(.callout)
          .padding()
          .fontWeight(.bold)
        Slider(value: .constant(50), in: 1...100)
        Text("100")
          .padding()
          .font(.callout)
          .fontWeight(.bold)
      }
      Button("Hit me") {
        print("Click on the buttonf")
        alertIsVisible.toggle()
        print(alertIsVisible)
      }.buttonStyle(.bordered)
        .alert(LocalizedStringKey(
          stringLiteral: "You won\n 🥰"), isPresented: $alertIsVisible, actions: { Button{} label: {
            Text("It's ok to cry")
              .fontWeight(.black)
          } } )
    }
  }
}

#Preview {
  ContentView()
}
