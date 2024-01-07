//
//  LeaderBoardView.swift
//  Bullseye
//
//  Created by Ariel Merino on 03/01/24.
//

import SwiftUI

struct LeaderBoardView: View {
    var body: some View {
		ZStack{
			Color(.bckgnd)
				.ignoresSafeArea()
			VStack(spacing: 10){
				HeaderView()
				LabelView()
				RowView(index: 1, score: 10, date: Date())
			}
		}
    }
}

struct HeaderView: View {
	var body: some View {
		ZStack {
			BigBoldText(text: "leaderboard")
			HStack{
				Spacer()
				Button{
					print("Hello wordls!!!")
				} label: {
					RoundedImageViewStroked(systemName: "xmark")
				}
			}
			
		}
		.padding()
	}
}


struct LabelView: View {
	var body: some View {
		HStack{
			Spacer()
				.frame(width: Constants.General.roundedViewLenght)
			Spacer()
			LabelText(text: "Score")
				.frame(width: Constants.LeaderBoard.scoreColumnWidth)
			Spacer()
			LabelText(text: "Date")
				.frame(width: Constants.LeaderBoard.dateColumnWidth)
		}		
		.padding(.horizontal)
		.frame(maxWidth: Constants.LeaderBoard.maxRowWidth)
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
