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
				.kerning(Constants.General.kerning)
				.padding(.horizontal)
			BigNumber(game: $game)
		}
	}
}

struct LabelText: View {
	var text: String
	
	var body: some View{
		Text(text.uppercased())
			.kerning(Constants.General.kerning)
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
			.clipShape(RoundedRectangle(cornerRadius: Constants.General.cornerRadius))
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
			LabelText(text: "You scored \(game.points(sliderValue: Int(bullseyeValue))) points")
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

struct RoundedTextView: View{
	@Binding var text: String
	
	var body: some View{
		Text(text)
			.bold()
			.font(.title3)
			.frame(width: 58, height: 58)
			.overlay{
				Circle()
					.stroke(.leaderboardRow ,lineWidth: Constants.General.borderWidth)
			}
			.foregroundStyle(.textViews)
	}
}

struct RoundedImageViewStroked: View {
	var systemName: String
	var body: some View {
		Image(systemName: systemName)
			.font(.title)
			.foregroundStyle(.textViews)
			.frame(width: Constants.General.roundedViewLenght, height: Constants.General.roundedViewLenght)
			.overlay(
				Circle()
					.strokeBorder(.roundedButton, lineWidth: Constants.General.strokeWidth)
			)
	}
}

struct ScoreText: View{
	var score: Int
	var body: some View {
		Text(String(score))
			.kerning(Constants.General.kerning)
			.fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
			.foregroundStyle(.textViews)
	}
}

struct DateText: View{
	var date: Date
	var body: some View {
		Text(date, style: .time)
			.kerning(Constants.General.kerning)
			.fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
			.foregroundStyle(.textViews)

	}
}

struct BigBoldText: View {
	let text: String
	var body: some View {
		Text(text.uppercased())
			.kerning(Constants.General.kerning)
			.font(.title)
			.foregroundStyle(.textViews)
			.bold()
	}
}

#Preview{
	
	CustomAlert(bullseyeValue: .constant(50), game: .constant(Game()), alertIsVisible: .constant(true) )
}

#Preview{
	InstructionsText(game: .constant(Game()))
}

#Preview("RoundedText"){
	VStack{
		RoundedTextView(text: .constant("1"))
		ScoreText(score: 12)
		DateText(date: Date())
		BigBoldText(text: "leaderboard")
		RoundedImageViewStroked(systemName: "arrow.clockwise")
	}
}
