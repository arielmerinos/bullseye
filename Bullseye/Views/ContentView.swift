//
//  ContentView.swift
//  Bullseye
//
//  Created by Ariel Merino on 30/12/23.
//

import SwiftUI

func messageContest(status: Bool, points: Int) -> String{
	status ? "🥳 ¡Ganaste! 🥳 \n +\(points) puntos " : "+\(points) puntos"
}

struct ContentView: View {
	
	@State var bullseyeValue: Double = 50.0
	@State var alertIsVisible: Bool = false
	@State var game: Game = Game()
	
	var body: some View {

		ZStack(alignment:.topLeading){
			BackgroundView(game: $game)
			
			Image(.pattern)
				.rotationEffect(.degrees(90))
				.ignoresSafeArea()
				
			VStack{
				InstructionsText(game: $game)
				SliderView(bullseyeValue: $bullseyeValue)
				HitMeButtonView(alertIsVisible:$alertIsVisible, bullseyeValue: $bullseyeValue, game: $game)
				Spacer()
			}
		}
	}
}

#Preview {
	ContentView()
}
