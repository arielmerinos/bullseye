//
//  LeaderBoardView.swift
//  Bullseye
//
//  Created by Ariel Merino on 03/01/24.
//

import SwiftUI

struct LeaderBoardView: View {
    var body: some View {
        RowView(index: 1, score: 10, date: Date())
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
