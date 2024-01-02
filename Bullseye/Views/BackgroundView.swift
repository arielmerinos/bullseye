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
		ZStack{
			RingsView()
			
			VStack{
				TopView(game: $game)
				Spacer()
				BottomView(game: $game, round: $game.round)
			}
			.padding()
		}
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

struct RingsView: View{
	
	
	var body: some View{

		ZStack{
			Color.bckgnd.ignoresSafeArea()
			ForEach(1..<5){ ring in
				Circle()
					.stroke(lineWidth: 30)
					.fill(
						RadialGradient(colors: [.white.opacity(0.8 * 0.3), .white.opacity(0)], center: .center, startRadius: 0, endRadius: 500)
					)
					.frame(width: CGFloat(100 * ring), height: CGFloat(100 * ring))
				
				
			}
		}
	}
}

#Preview {
	BackgroundView(game: .constant(Game()))
}
#Preview("Rings view"){
	RingsView()
}
