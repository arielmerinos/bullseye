//
//  LeaderboardButton.swift
//  Bullseye
//
//  Created by Ariel Merino on 31/12/23.
//


import SwiftUI

struct IconButton: View {
	var iconName: String
	
	var body: some View {
		VStack{
			Image(systemName: iconName)
				.foregroundStyle(.roundedText)
				.fontWeight(.bold)
				.contentTransition(.numericText(countsDown: true))
				.font(.title)
		}
		.frame(width: 90, height: 50)
		.background(Color.roundedButton)
		.clipShape(RoundedRectangle(cornerRadius: 25))
		.zIndex(1)
	}
}

#Preview {
	IconButton(iconName: "list.bullet")
}


