//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    let allQuestions = QuestionBank()
    var pickedAnswer: Bool = false
    var questionNumber = 0
    var totalScore = 0
    var totalNumberOfQuestions: Int = 0
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalNumberOfQuestions = allQuestions.list.count
        updateUI()
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        
        // tag if right then 1 else 2
        if sender.tag == 1 {
            pickedAnswer = true
        } else {
            pickedAnswer = false
        }
        
        checkAnswer()
    }
    
    
    func updateUI() {
        questionLabel.text = allQuestions.list[questionNumber].questionText
        scoreLabel.text = "Score: \(totalScore)"
        progressLabel.text = "\(questionNumber + 1)/\(totalNumberOfQuestions)"
    }
    

    func nextQuestion() {
        questionNumber += 1
        if questionNumber == allQuestions.list.count {
            startOver()
        }
        
        updateUI()
    }
    
    
    func checkAnswer() {
        let correctAnswer = allQuestions.list[questionNumber].answer
       
        if pickedAnswer == correctAnswer {
            totalScore += 10
        } else {
            
        }
        
        nextQuestion()
    }
    
    
    func startOver() {
        questionNumber = 0
        totalScore = 0
        scoreLabel.text = "Score: \(totalScore)"
        questionLabel.text = allQuestions.list[questionNumber].questionText
    }
}
