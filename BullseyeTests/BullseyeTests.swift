//
//  BullseyeTests.swift
//  BullseyeTests
//
//  Created by Ariel Merino on 30/12/23.
//

import XCTest
@testable import Bullseye

final class BullseyeTests: XCTestCase {
	var game: Game!
	
	override func setUpWithError() throws {
		// Put setup code here. This method is called before the invocation of each test method in the class.
		game = Game()
	}
	
	override func tearDownWithError() throws {
		// Put teardown code here. This method is called after the invocation of each test method in the class.
		game = nil
	}
	
	func testScorePositive(){
		let guess = game.target + 5
		let score = game.points(sliderValue: guess)
		XCTAssertEqual(score, 75)
	}
	
	func testScoreNegative(){
		let guess = game.target - 5
		let score = game.points(sliderValue: guess)
		XCTAssertEqual(score, 75)
	}
	
	func testScoreExact(){
		let guess = game.target
		let score = game.points(sliderValue: guess)
		XCTAssertEqual(score, 200)
	}
	
	
	func testNewRound(){
		game.startNewRound(points: 100)
		
		XCTAssertEqual(game.score, 100)
		XCTAssertEqual(game.round, 2)
	}
	
	func testRestart(){
		game.startNewRound(points: 100)
		XCTAssertNotEqual(game.score, 0)
		XCTAssertNotEqual(game.round, 1)
		game.restart()
		XCTAssertEqual(game.score, 0)
		XCTAssertEqual(game.round, 1)
	}
	
	func testLeaderboard(){
		game.startNewRound(points: 20)
		
		XCTAssertEqual(game.leaderboardEntries.count, 1)
		XCTAssertEqual(game.leaderboardEntries[0].score, 20)
		
		game.startNewRound(points: 25)
		XCTAssertEqual(game.leaderboardEntries.count, 2)
		XCTAssertEqual(game.leaderboardEntries[2].score, 25)
	}
}
