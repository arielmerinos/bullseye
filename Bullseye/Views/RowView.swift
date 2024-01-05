//
//  RowView.swift
//  Bullseye
//
//  Created by Ariel Merino on 03/01/24.
//

import SwiftUI

struct RowView: View {
	let index: Int
	let score: Int
	let date: Date
	
	
    var body: some View {
		HStack{
			RoundedTextView(text: .constant("1"))
			Spacer()
			ScoreText(score: 24)
				.frame(width: Constants.LeaderBoard.scoreColumnWidth)
			Spacer()
			DateText(date: Date())
				.frame(width: Constants.LeaderBoard.dateColumnWidth)
		}
		.background(RoundedRectangle(cornerRadius: .infinity).stroke(.leaderboardRow, lineWidth: Constants.General.borderWidth))
		.padding(.horizontal)
		.frame(maxWidth: Constants.LeaderBoard.maxRowWidth)
    }
}

#Preview {
    RowView(index: 2, score: 2, date: Date())
}
