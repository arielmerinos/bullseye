//
//  CounterView.swift
//  Bullseye
//
//  Created by Ariel Merino on 31/12/23.
//

import SwiftUI

struct CounterView: View {
	@Binding var points: Int
	
    var body: some View {
		VStack{
			Text("\(points)")
				.foregroundStyle(.white)
				.fontWeight(.black)
				.contentTransition(.numericText(countsDown: true))
				.font(.title)
			Text("Points")
				.font(.caption2)
				.foregroundStyle(.white)
		}
		.frame(width: 90, height: 50)
		.background(Color.hitmebutton)
		.clipShape(RoundedRectangle(cornerRadius: 25))
		.zIndex(1)
    }
}

#Preview {
	CounterView(points: .constant(430))
}

