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
	var leaderboardEntries: [LeaderBoardEntry] = []
	
	func points(sliderValue: Int) -> Int {
		var resultado = 100 - min(Int(truncating: NSDecimalNumber(decimal: pow(Decimal(abs(sliderValue - target)), 2))), 100)
		
		
		if(sliderValue == target){
			resultado += 100
		}
		return resultado
	}
	
	mutating func startNewRound(points: Int){
		score += points
		
		leaderboardEntries.sort{
			itemA, itemB in
			itemA.date < itemB.date
		}
		
		round += 1
		target = Int.random(in: 3...97)
		
		
	}
	
	mutating func restart(){
		score = 0
		round = 1
		target = Int.random(in: 3...97)
	}
	
}

struct LeaderBoardEntry{
	let score: Int
	let date: Date
}



