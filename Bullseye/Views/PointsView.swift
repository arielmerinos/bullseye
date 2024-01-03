//
//  PointsView.swift
//  Bullseye
//
//  Created by Ariel Merino on 02/01/24.
//

import SwiftUI

struct PointsView: View {
	@Binding var game: Game
	@Binding var alertIsVisible: Bool
	@Binding var bullseyeValue: Double
	
    var body: some View {
		CustomAlert( bullseyeValue: $bullseyeValue, game: $game, alertIsVisible: $alertIsVisible)
			.padding()
			.frame(maxWidth: 300)
			.background(.bckgnd)
			.clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/))
			.shadow(radius: 10, x: 5, y: 5)
    }
}

#Preview {
	PointsView(game: .constant(Game()), alertIsVisible: .constant(true), bullseyeValue: .constant(50.0))
}
