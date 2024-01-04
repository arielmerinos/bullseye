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
			Slider(value: .constant(50))
				.padding()
		}
		.background(RoundedRectangle(cornerRadius: .infinity).stroke(.leaderboardRow, lineWidth: Constants.General.borderWidth))
    }
}

#Preview {
    RowView(index: 2, score: 2, date: Date())
}
