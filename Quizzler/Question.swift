//
//  Question.swift
//  Quizzler
//
//  Created by Shritesh Jamulkar on 23/05/18.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import Foundation

class Question {
    
    let  qtext : String
    let answer : Bool 
    
    init(text: String, correctAnswer: Bool) {
        self.qtext = text
        self.answer = correctAnswer
    }
    
    
}
