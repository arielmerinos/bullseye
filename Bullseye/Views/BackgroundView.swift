//
//  BackgroundView.swift
//  Bullseye
//
//  Created by Ariel Merino on 01/01/24.
//

import SwiftUI
import Foundation

struct BackgroundView: View {
	@Binding var game: Game
	
	
    var body: some View {
		VStack{
			TopView(game: $game)
			Spacer()
			BottomView(game: $game, round: $game.round)
		}
		.padding()
		.background(.bckgnd)
    }
}


struct TopView: View {
	@Binding var game: Game
	
	var body: some View {
		HStack{
			CounterView(points: $game.score, caption: "Score")
				.padding()
			Spacer()
			IconButton(iconName: "list.bullet" )
				.padding()
		}
	}
}


struct BottomView: View {
	@Binding var game: Game
	@Binding var round: Int
	
	var body: some View {
		HStack{
			IconButton(iconName: "arrow.counterclockwise").onTapGesture {
				withAnimation{
					game.restart()
				}
			}
			Spacer()
			CounterView(points: $game.round, caption: "Round")
		}.padding(24)
		
	}
}

#Preview {
	BackgroundView(game: .constant(Game()))
}
