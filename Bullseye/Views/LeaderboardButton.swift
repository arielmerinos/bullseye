//
//  LeaderboardButton.swift
//  Bullseye
//
//  Created by Ariel Merino on 31/12/23.
//


import SwiftUI

struct LeaderboardButton: View {
	
	var body: some View {
		VStack{
			Image(systemName: "list.bullet")
				.foregroundStyle(.white)
				.fontWeight(.black)
				.contentTransition(.numericText(countsDown: true))
				.font(.title)
		}
		.frame(width: 90, height: 50)
		.background(Color.hitmebutton)
		.clipShape(RoundedRectangle(cornerRadius: 25))
		.zIndex(1)
	}
}

#Preview {
	LeaderboardButton()
}


