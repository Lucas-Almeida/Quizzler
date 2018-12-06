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
        nextQuestion()
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        // tag if right then 1 else 2
        if sender.tag == 1 {
            pickedAnswer = true
        } else {
            pickedAnswer = false
        }
        
        checkAnswer()
        
        questionNumber += 1
        
        nextQuestion()
    }
    
    
    func updateUI() {
        questionLabel.text = allQuestions.list[questionNumber].questionText
        scoreLabel.text = "Score: \(totalScore)"
        progressLabel.text = "\(questionNumber + 1)/\(totalNumberOfQuestions)"
        progressBar.frame.size.width = (view.frame.size.width / CGFloat(totalNumberOfQuestions)) * CGFloat(questionNumber + 1)
    }
    

    func nextQuestion() {
        if questionNumber >= allQuestions.list.count {
            let alert = UIAlertController(title: "Awesome", message: "You`ve finished all the questions, do you want to start over?", preferredStyle: .alert)
            
            let restartAction = UIAlertAction(title: "Restart", style: .default) { (UIAlertAction) in
                self.startOver()
            }
            
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
        } else {
            updateUI()
        }
    }
    
    
    func checkAnswer() {
        let correctAnswer = allQuestions.list[questionNumber].answer
       
        if pickedAnswer == correctAnswer {
            ProgressHUD.showSuccess("Correct")
            totalScore += 10
        } else {
            ProgressHUD.showError("Wrong")
        }
    }
    
    
    func startOver() {
        questionNumber = 0
        totalScore = 0
        updateUI()
    }
}
