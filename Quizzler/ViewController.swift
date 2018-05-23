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
    var pickedAnswer : Bool = false
    var questionNo : Int = 0
    var score : Int = 0
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let firstQuestion = allQuestions.list[0]
        
        questionLabel.text = firstQuestion.qtext
        updateUI()
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1 {
            pickedAnswer = true
        }
        else {
            pickedAnswer = false
        }
        
        checkAnswer()
        questionNo += 1
        nextQuestion()
        
    }
    
    
    func updateUI() {
        scoreLabel.text = "Score: \(score)"
        progressLabel.text = "\(questionNo + 1)/13"
        progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(questionNo + 1)
    }
    

    func nextQuestion() {
        if questionNo < allQuestions.list.count {
            questionLabel.text = allQuestions.list[questionNo].qtext
            updateUI()
        }
        else {
            let alert = UIAlertController(title: "Awsome", message: "You've finished all the questions, do you want to start over? ", preferredStyle: .alert)
            
            let restartAction = UIAlertAction(title: "Restart", style: .default) { (UIAlertAction) in
                self.startOver()
            }
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
        }
    }
    
    
    func checkAnswer() {
        let correctAns = allQuestions.list[questionNo].answer
        if (correctAns == pickedAnswer){
            score += 1
            ProgressHUD.showSuccess("Correct!")
        }else {
            ProgressHUD.showError("Wrong!")
        }
        
    }
    
    
    func startOver() {
       questionNo = 0
        score = 0
        nextQuestion()
        updateUI()
    }
    

    
}
