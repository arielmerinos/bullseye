///Users/arielmerino/Documents/ios/netflixing/bullseye/Bullseye/BullseyeTests/BullseyeTests.swift
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
	
	
	init(loadTestData: Bool = false){
		if loadTestData{
			addToLeaderboard(score: 100)
			addToLeaderboard(score: 485)
			addToLeaderboard(score: 53)
			addToLeaderboard(score: 5553)
			addToLeaderboard(score: 554)
			addToLeaderboard(score: 32)
		}
	}
	
	func points(sliderValue: Int) -> Int {
		var resultado = 100 - min(Int(truncating: NSDecimalNumber(decimal: pow(Decimal(abs(sliderValue - target)), 2))), 100)
		
		
		if(sliderValue == target){
			resultado += 100
		}
		return resultado
	}
	
	mutating func startNewRound(points: Int){
		addToLeaderboard(score: points)
		score += points
		// Increase the round value
		round += 1
		// Choose randomly the target value
		target = Int.random(in: 3...97)
		
		
	}
	
	mutating func addToLeaderboard(score: Int){
		leaderboardEntries.append(LeaderBoardEntry(score: score, date: Date()))
		
		leaderboardEntries.sort { itemA, itemB in
			itemA.score > itemB.score
		}
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



