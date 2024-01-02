//
//  CounterView.swift
//  Bullseye
//
//  Created by Ariel Merino on 31/12/23.
//

import SwiftUI

struct CounterView: View {
	@Binding var points: Int
	var caption: String
	
    var body: some View {
		VStack{
			Text("\(points)")
				.fontWeight(.black)
				.contentTransition(.numericText(countsDown: true))
				.font(.title)
			Text(caption)
				.font(.caption2)
		}
		.frame(width: 90, height: 50)
		.background(.roundedButton)
		.foregroundStyle(.roundedText)
		.clipShape(RoundedRectangle(cornerRadius: 25))
		.zIndex(1)
    }
}

#Preview {
	CounterView(points: .constant(430), caption: "Points")
}

