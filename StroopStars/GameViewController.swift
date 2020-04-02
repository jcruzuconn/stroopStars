//
//  GameViewController.swift
//  StroopStars
//
//  Created by Jasper Cruz on 3/31/20.
//  Copyright © 2020 Jasper Cruz. All rights reserved.
//

import UIKit

class GameViewController: UIViewController{
    
    let Ws =  Questions()
    var timer = Timer()
    var (minutes,seconds,fractions) = (0,0,0)
    var isTimerRunning = false
    var mode = "1"
    var selection: String?
    var question = 1
    
    @IBOutlet weak var wordBox: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerTextBox: UITextField!
    @IBOutlet weak var modeLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage:UIImage (named:"BackgroundImage3")!)
        Ws.getQuestions()
        let m = "\(String(describing: selection ?? "nil"))"
        if m == "1"{
            mode = "1"
        }
        if m == "2"{
            mode = "2"
        }
    
    }
    
    
    
    @IBAction func answerButton(_ sender: Any) {
        let c = Ws.currentQuestionNumbers()
        if answerTextBox.text == Ws.allWords[c].color && mode == "1" && c <= 9{
            let n = Ws.nextQuestionNumber()
            answerTextBox.text = ""
            wordBox.text = Ws.allWords[n].name
            wordBox.textColor = UIColor(red: CGFloat(Ws.allWords[n].red), green: CGFloat(Ws.allWords[n].green) , blue: CGFloat(Ws.allWords[n].blue), alpha: CGFloat(Ws.allWords[n].alpha))
            question = Ws.correctAnswer()
            questionLabel.text = "Question: \(n)"
        }
        if answerTextBox.text == Ws.allWords[c].name && mode == "2" && c <= 9{
            let n = Ws.nextQuestionNumber()
            answerTextBox.text = ""
            wordBox.text = Ws.allWords[n].name
            wordBox.textColor = UIColor(red: CGFloat(Ws.allWords[n].red), green: CGFloat(Ws.allWords[n].green) , blue: CGFloat(Ws.allWords[n].blue), alpha: CGFloat(Ws.allWords[n].alpha))
            question = Ws.correctAnswer()
            questionLabel.text = "Question: \(n)"
        }
        if Ws.currentQuestionNumbers() == 10{
            wordBox.text = "Finish!"
            wordBox.textColor = UIColor.black
            timer.invalidate()
            
        }
    }
    
    @IBAction func startButton(_ sender: Any) {
        Ws.getQuestions()
        question = 0
        let x = Ws.resetQuestionNumbers()
        questionLabel.text = "Question: \(x)"
        if mode == "1"{
            modeLabel.text = "Mode 1: What is the color?"
        }
        if mode == "2"{
            modeLabel.text = "Mode 2: What is the word?"
        }
        wordBox.text = Ws.allWords[x].name
        wordBox.textColor = UIColor(red: CGFloat(Ws.allWords[x].red), green: CGFloat(Ws.allWords[x].green) , blue: CGFloat(Ws.allWords[x].blue), alpha: CGFloat(Ws.allWords[x].alpha))
        fractions = 0
        seconds = 0
        minutes = 0
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(GameViewController.keepTimer), userInfo: nil, repeats: true)
    }
    
    
    @objc func keepTimer() {
        fractions += 1
        if fractions > 99{
            seconds += 1
            fractions = 0
        }
        if seconds > 60{
            minutes += 1
            seconds = 0
        }
        
        timeLabel.text = "Timer: \(minutes):\(seconds):\(fractions)"
    }
    
    @IBAction func submitButton(_ sender: Any) {
        let barViewControllers = self.tabBarController?.viewControllers
        let times = barViewControllers![2] as! TimesViewController
        if mode == "1"{
            times.bestMode1Time = "\(minutes):\(seconds):\(fractions)"}
        if mode == "2"{
            times.bestMode2Time = "\(minutes):\(seconds):\(fractions)"}
        times.viewDidLoad()
    }

    
    
    
    
    
    
}
