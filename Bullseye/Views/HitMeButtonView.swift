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
		
		Button {
			withAnimation{
				
				alertIsVisible.toggle()
			}
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
    }
}

