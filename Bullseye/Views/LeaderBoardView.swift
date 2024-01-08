//
//  LeaderBoardView.swift
//  Bullseye
//
//  Created by Ariel Merino on 03/01/24.
//

import SwiftUI

struct LeaderBoardView: View {
	@Binding var isLeaderboardPresented: Bool
	
    var body: some View {
		ZStack{
			Color(.bckgnd)
				.ignoresSafeArea()
			VStack(spacing: 10){
				HeaderView(isLeaderboardPresented: $isLeaderboardPresented)
				LabelView()
				RowView(index: 1, score: 10, date: Date())
			}
			.padding()
		}
		
    }
}

struct HeaderView: View {
	@Environment(\.verticalSizeClass) var verticalSizeClass
	@Environment(\.horizontalSizeClass) var horizontalSizeClass
	@Binding var isLeaderboardPresented: Bool
	var body: some View {
		ZStack {
			HStack {
				BigBoldText(text: "leaderboard")
				if verticalSizeClass == .regular && horizontalSizeClass == .compact {
					Spacer()
				}
			}
			.padding()
			HStack{
				Spacer()
				Button{
					isLeaderboardPresented.toggle()
				} label: {
					RoundedImageViewStroked(systemName: "xmark")
				}
			}
			.padding()
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
		.frame(maxWidth: Constants.LeaderBoard.maxRowWidth * 0.8)
	}
}

struct RowView: View {
	let index: Int
	let score: Int
	let date: Date
	@Environment(\.horizontalSizeClass) var horizontalSizeClass
	@Environment(\.verticalSizeClass) var verticalSizeClass
	@State var isPopOverPresented = false
	
	
	var body: some View {
		HStack{
			Button{
				isPopOverPresented.toggle()
			} label: {
				RoundedTextView(text: .constant("1"))
					.popover(isPresented: $isPopOverPresented){
						ZStack{
							Color(.bckgnd)
							VStack{
								if !(horizontalSizeClass == .compact && verticalSizeClass == .regular ){
									Button{
										isPopOverPresented.toggle()
									} label: {
										RoundedImageViewStroked(systemName: "xmark")
									}
								}
								
								Text("The position's mark")
									.font(.callout)
									.foregroundStyle(.textViews)
									.padding()
									.presentationCompactAdaptation(horizontal: .popover
																   , vertical: .fullScreenCover)
							}
						}
//						.ignoresSafeArea()
					}
			}
			Spacer()
			ScoreText(score: 24)
				.frame(width: Constants.LeaderBoard.scoreColumnWidth)
			Spacer()
			DateText(date: Date())
				.frame(width: Constants.LeaderBoard.dateColumnWidth)
		}
		.background(RoundedRectangle(cornerRadius: .infinity).stroke(.leaderboardRow, lineWidth: Constants.General.borderWidth))
		.padding(.horizontal)
		.frame(maxWidth: Constants.LeaderBoard.maxRowWidth * 0.8)
	}
}


#Preview{
	LeaderBoardView(isLeaderboardPresented: .constant(true))
}
