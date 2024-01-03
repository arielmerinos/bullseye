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

		ZStack{
			BackgroundView(game: $game)
				
			VStack{
				InstructionsText(game: $game)
					.padding(.bottom, alertIsVisible ? 0 : 100 )
				if alertIsVisible{
					PointsView(game: $game, alertIsVisible: $alertIsVisible, bullseyeValue: $bullseyeValue)
				} else {
					HitMeButtonView(alertIsVisible:$alertIsVisible, bullseyeValue: $bullseyeValue, game: $game)
				}
//				Spacer()
			}
			if !alertIsVisible{
				
				SliderView(bullseyeValue: $bullseyeValue)
					.padding(.top, 100)
			}
		}
	}
}

#Preview {
	ContentView()
}
