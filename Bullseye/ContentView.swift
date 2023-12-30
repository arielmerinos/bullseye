//
//  ContentView.swift
//  Bullseye
//
//  Created by Ariel Merino on 30/12/23.
//

import SwiftUI

struct ContentView: View {
    @State var bullseyeValue: Double = 50.0
    @State var randomEye: Int = Int.random(in: 1...100)
    var body: some View {
        ZStack{
            VStack{
                Button{
                    withAnimation{
                        randomEye = Int.random(in: 1...100)
                    }
                } label: {
                    Label(
                        title: { Text("Restart") },
                        icon: { Image(systemName: "arrow.clockwise") }
                    )
                }
                .symbolEffect(.bounce, value: randomEye)	
                .position(x: 40.0, y: 20.0)
                .buttonStyle(.bordered)
                .padding()

            }
            VStack {
                Text("Put the bullseye as close as you can to!")
                Text("🎯🎯🎯")
                Text("\(randomEye)")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .padding(.vertical)
                    .contentTransition(.numericText())
                HStack(alignment: .center){
                    Text("0")
                        .padding(8)
                    Slider(value: $bullseyeValue , in: 1...100)
                    Text("100")
                        .padding(1)
                }
                Text("\(Int(bullseyeValue))")
                Button{
                    
                } label: {
                    Text("Go!")
                        .fontWeight(.heavy)
                        .font(.callout)
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
                
            }
            .padding()
        }
    }
}

#Preview {
    ContentView(bullseyeValue: 50.0   )
}
