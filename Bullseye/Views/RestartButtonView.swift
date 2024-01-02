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
		.frame(width: 40, height: 40)
		.contentTransition(.symbolEffect(.replace))
		.background(.hitmebutton)
		.font(.title3)
		.foregroundStyle(.white)
		.clipShape(Circle())
    }
}

#Preview {
	RestartButtonView(game: .constant(Game()))
}
