//
//  RestartButtonView.swift
//  Bullseye
//
//  Created by Ariel Merino on 31/12/23.
//

import SwiftUI

struct RestartButtonView: View {
	@Binding var game: Game
    var body: some View {
		Button{
			withAnimation{
				game.target = Int.random(in: 3...97)
			}
		} label: {
			
			Label("", systemImage: "arrow.counterclockwise")
				.labelStyle(.iconOnly)
		}
		.contentTransition(.symbolEffect(.replace))
		.buttonStyle(.bordered)
		Spacer()

    }
}

