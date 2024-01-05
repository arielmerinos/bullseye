//
//  LeaderBoardView.swift
//  Bullseye
//
//  Created by Ariel Merino on 03/01/24.
//

import SwiftUI

struct LeaderBoardView: View {
    var body: some View {
		VStack(spacing: 10){
			HeaderView()
			RowView(index: 1, score: 10, date: Date())
		}
    }
}

struct HeaderView: View {
	var body: some View {
		ZStack {
			BigBoldText(text: "leaderboard")
			HStack{
				Spacer()
				Text("x")
			}
		}
	}
}

#Preview {
    LeaderBoardView()
		.preferredColorScheme(.dark)
}
#Preview ("Dark"){
    LeaderBoardView()
		.previewInterfaceOrientation(.landscapeRight)
}
