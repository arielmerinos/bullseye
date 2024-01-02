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
		Spacer()
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
		Text("\(game.target)")
			.foregroundStyle(.textViews)
			.font(.largeTitle)
			.fontWeight(.heavy)
			.contentTransition(.numericText())
    }
}


