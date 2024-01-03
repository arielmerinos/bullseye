//
//  TextView.swift
//  Bullseye
//
//  Created by Ariel Merino on 31/12/23.
//

import SwiftUI

struct InstructionsText: View {
	@Binding var game: Game
	
	var body: some View {
		VStack{
			Text("🎯🎯🎯")
				.foregroundStyle(.textViews)
				.font(Font.system(size: 68, weight: .black))
				.padding(.bottom)
			Text("Put the bullseye as close as you can to")
				.foregroundStyle(.textViews)
				.fontWeight(.bold)
				.textCase(.uppercase)
				.multilineTextAlignment(.center)
				.lineSpacing(6)
				.kerning(2.0)
				.padding(.horizontal)
			BigNumber(game: $game)
		}
	}
}

struct LabelText: View {
	var text: String
	
	var body: some View{
		Text(text.uppercased())
			.kerning(1.5)
			.font(.caption)
			.bold()
			.multilineTextAlignment(.center)
			.lineSpacing(12)
	}
}
struct BodyText: View {
	var text: String
	
	var body: some View{
		Text(text)
	}
}

struct ButtonText: View {
	var text: String
	var body: some View {
		Text(text)
			.frame(maxWidth: .infinity)
			.padding()
			.background(.slider)
			.foregroundStyle(.white)
			.fontWeight(.bold)
			.clipShape(RoundedRectangle(cornerRadius: 12))
	}
}

struct BigNumber: View {
	@Binding var game: Game
	var body: some View {
		Text("\(game.target)")
			.foregroundStyle(.textViews)
			.font(.largeTitle)
			.fontWeight(.heavy)
			.contentTransition(.numericText())
	}
}


struct BigNumberValue: View {
	@Binding var game: Double
	var body: some View {
		Text("\(Int(game))")
			.foregroundStyle(.textViews)
			.font(.largeTitle)
			.fontWeight(.heavy)
			.contentTransition(.numericText())
	}
}

struct CustomAlert: View {
	@Binding var bullseyeValue: Double
	@Binding var game: Game
	@Binding var alertIsVisible: Bool
	
	var body: some View{
		VStack(spacing: 10){
			LabelText(text: "The slider's value is")
				.font(.title3)
			BigNumberValue(game: $bullseyeValue)
			LabelText(text: "You scored 200 points")
			Button{
				withAnimation{
					game.score += game.points(sliderValue: Int(bullseyeValue))
					game.round += 1
				}
				withAnimation{
					game.target = Int.random(in: 3...97)
					alertIsVisible.toggle()
				}
			} label: {
				ButtonText(text: "Start new round!")
			}
		}
	}
}

#Preview{
	
	CustomAlert(bullseyeValue: .constant(50), game: .constant(Game()), alertIsVisible: .constant(true) )
}

#Preview{
	InstructionsText(game: .constant(Game()))
}
