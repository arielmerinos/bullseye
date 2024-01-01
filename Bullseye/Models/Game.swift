//
//  Game.swift
//  Bullseye
//
//  Created by Ariel Merino on 30/12/23.
//

import Foundation

struct Game {
  var target: Int = Int.random(in: 3...97)
  var score: Int = 0
  var round: Int = 1
  
  func points(sliderValue: Int) -> Int {
    print(String(min(Int(truncating: NSDecimalNumber(decimal: pow(Decimal(abs(sliderValue - target)), 2))), 0)))
    return 100 - min(Int(truncating: NSDecimalNumber(decimal: pow(Decimal(abs(sliderValue - target)), 2))), 100)
  }
}
