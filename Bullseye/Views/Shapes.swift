//
//  Shapes.swift
//  Bullseye
//
//  Created by Ariel Merino on 31/12/23.
//

import SwiftUI

struct Shapes: View {
    var body: some View {
		VStack{
			Circle()
				.background(Color.green)
				.frame(width: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
		}
    }
}

#Preview {
    Shapes()
}
