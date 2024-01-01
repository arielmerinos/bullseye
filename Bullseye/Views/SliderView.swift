//
//  SliderView.swift
//  Bullseye
//
//  Created by Ariel Merino on 31/12/23.
//

import SwiftUI

struct SliderView: View {
	@Binding var bullseyeValue: Double
	
    var body: some View {
		HStack{
			Text("1")
				.foregroundStyle(.textViews)
				.font(.callout)
				.padding()
				.fontWeight(.bold)
			Slider(value: $bullseyeValue, in: 1...100, step: 1)
			Text("100")
				.foregroundStyle(.textViews)
				.padding()
				.font(.callout)
				.fontWeight(.bold)
		}
    }
}
