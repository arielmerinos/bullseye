//
//  HitMeButtonView.swift
//  Bullseye
//
//  Created by Ariel Merino on 31/12/23.
//

import SwiftUI

struct HitMeButtonView: View {
	@Binding var alertIsVisible: Bool
	@Binding var bullseyeValue: Double
	@Binding var game: Game
	
	var gameStatus  = "I'm going back!"
	var isWinner: Bool {
		Double(game.target) == bullseyeValue
	}
	
	
    var body: some View {
		
		let quote = """
		 \(Int(bullseyeValue)) casi es \(game.target)
		 \(messageContest(status: isWinner, points: game.points(sliderValue: Int(bullseyeValue))))
		 """
		
		Button {
			alertIsVisible.toggle()
		} label: {
			Label("Hit me!", systemImage: alertIsVisible ? "circle" : "circle.fill")
				.bold()
				.font(.title3)
				.textCase(.uppercase)
		}
		.padding(16)
		.background(
			LinearGradient(
				stops: [
					Gradient.Stop(color: .white.opacity(0.3), location: 0.00),
					Gradient.Stop(color: .white.opacity(0), location: 1.00),
				],
				startPoint: UnitPoint(x: 0.5, y: 0),
				endPoint: UnitPoint(x: 0.5, y: 1)
			)
		)
		.background(
			Color.hitmebutton
		)
		.clipShape(RoundedRectangle(cornerRadius: 16))
		.foregroundStyle(.white)
		.contentTransition(.symbolEffect(.replace))
		.overlay(
			RoundedRectangle(cornerRadius: 16)
				.strokeBorder(.white, lineWidth: 3.0)
		)
		.alert(
			quote,
			isPresented: $alertIsVisible,
			actions: {
				Button{
					withAnimation{
						game.score += game.points(sliderValue: Int(bullseyeValue))
						game.round += 1
					}
					withAnimation{
						game.target = Int.random(in: 3...97)
					}
					
				} label: {
					Text(gameStatus)
						.fontWeight(.black)
						.bold()
				}
			}
		)
    }
}

