//
//  ListOfQuestions.swift
//  StroopStars
//
//  Created by Jasper Cruz on 3/31/20.
//  Copyright © 2020 Jasper Cruz. All rights reserved.
//

import Foundation
import UIKit



public class Questions {
    

    public var allWords = [Color]()
    public var gameStart: Bool = false
    public var gameEnd: Bool = false
    public var words = ["Red", "Orange", "Yellow", "Green", "Blue", "Purple"]
    public var colors = ["Red", "Orange", "Yellow", "Green", "Blue", "Purple"]
    public var redHex = [1.0,0.0,0.0]
    public var orangeHex = [1.0,0.5,0.0]
    public var yellowHex = [1.0,1.0,0.0]
    public var greenHex = [0.0,1.0,0.0]
    public var blueHex = [0.0,0.0,1.0]
    public var purpleHex = [0.5,0.0,0.5]

    
    public func getRandom() -> String{
        let randomColor = colors.randomElement()!
        return randomColor
    }
    
    
    
    public func getQuestions() {
        for i in 1...11{
            var redVal: Double = 1.0
            var greenVal: Double = 1.0
            var blueVal: Double = 1.0
            let randomColor = getRandom()
            if randomColor == "Red"{
                redVal = redHex[0]
                greenVal = redHex[1]
                blueVal = redHex[2]
            }
            if randomColor == "Orange"{
                redVal = orangeHex[0]
                greenVal = orangeHex[1]
                blueVal = orangeHex[2]
            }
            if randomColor == "Yellow"{
                redVal = yellowHex[0]
                greenVal = yellowHex[1]
                blueVal = yellowHex[2]
            }
            if randomColor == "Green"{
                redVal = greenHex[0]
                greenVal = greenHex[1]
                blueVal = greenHex[2]
            }
            if randomColor == "Blue"{
                redVal = blueHex[0]
                greenVal = blueHex[1]
                blueVal = blueHex[2]
            }
            if randomColor == "Purple"{
                redVal = purpleHex[0]
                greenVal = purpleHex[1]
                blueVal = purpleHex[2]
            }
            let randomWord = words.randomElement()!
            allWords.append(Color(name: randomWord,color: randomColor, red: redVal, green: greenVal, blue: blueVal, alpha: 1.0))
        }}
        
    public var correctAnswers: Int = 0
    public var totalQuestionsAsked: Int = 0
    private var currentQuestionNumber: Int = 0
        
    public func correctAnswer() -> Int {
        correctAnswers = correctAnswers + 1
        totalQuestionsAsked = totalQuestionsAsked + 1
        return correctAnswers
    }
    
    public func nextQuestionNumber() -> Int {
        currentQuestionNumber = currentQuestionNumber + 1
        if currentQuestionNumber == 10{
            gameEnd = true}
        return currentQuestionNumber
    }

    public func currentQuestionNumbers() -> Int {
        return currentQuestionNumber
    }

    public func resetQuestionNumbers() -> Int {
        currentQuestionNumber = 0
        return currentQuestionNumber
    }


}
