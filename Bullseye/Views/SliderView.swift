//
//  SliderView.swift
//  Bullseye
//
//  Created by Ariel Merino on 31/12/23.
//

import SwiftUI
class CustomSlider: UISlider {
  
  //Set line height value from Interface Builder,i.e. here ten is default value
  @IBInspectable var trackLineHeight: CGFloat = 15
  
  //Set custom size of track so here override trackRect function of slider control
  override func trackRect(forBounds bound: CGRect) -> CGRect {
	return CGRect(origin: bound.origin, size: CGSize(width: bound.width, height: trackLineHeight))
  }
}

struct UISliderView: UIViewRepresentable {
	@Binding var value: Double
	
	var minValue = 1.0
	var maxValue = 100.0
	var thumbColor: UIColor = .white
	var minTrackColor: UIColor = .blue
	var maxTrackColor: UIColor = .lightGray
	//Set line height value from Interface Builder,i.e. here ten is default value
	var trackLineHeight: CGFloat = 10
	

	
	class Coordinator: NSObject {
		var value: Binding<Double>
		
		init(value: Binding<Double>) {
			self.value = value
		}
		
		@objc func valueChanged(_ sender: UISlider) {
			self.value.wrappedValue = Double(sender.value)
		}
	}
	
	func makeCoordinator() -> UISliderView.Coordinator {
		Coordinator(value: $value)
	}
	
	func makeUIView(context: Context) -> UISlider {
		let slider = CustomSlider(frame: .zero)
		slider.setThumbImage(UIImage(named: "bullseye"), for: .normal)
		slider.minimumTrackTintColor = minTrackColor
		slider.maximumTrackTintColor = maxTrackColor
		slider.minimumValue = Float(minValue)
		slider.maximumValue = Float(maxValue)
		slider.value = Float(value)
		
		slider.addTarget(
			context.coordinator,
			action: #selector(Coordinator.valueChanged(_:)),
			for: .valueChanged
		)
		
		return slider
	}
	
	func updateUIView(_ uiView: UISlider, context: Context) {
		uiView.value = Float(value)
	}
}



struct SliderView: View {
	@Binding var bullseyeValue: Double
	
    var body: some View {
		HStack(alignment: .bottom){
			Text("1")
				.foregroundStyle(.textViews)
				.font(.callout)
				.padding()
				.fontWeight(.bold)
				.frame(width: 70)
			UISliderView(value: $bullseyeValue,
						 minValue: 1.0,
						 maxValue: 100.0,
						 thumbColor: .red,
						 minTrackColor: .slider,
						 maxTrackColor: .slider)
			Text("100")
				.foregroundStyle(.textViews)
				.padding()
				.font(.callout)
				.fontWeight(.bold)
				.frame(width: 70)

		}
    }
}

#Preview {
	SliderView(bullseyeValue: .constant(2.0))
}
