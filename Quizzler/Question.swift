//
//  Question.swift
//  Quizzler
//
//  Created by 刘泉 on 2021/1/18.
//  Copyright © 2021 rongcosme. All rights reserved.
//

import Foundation

class Question{
    let answer : Bool
    let questionText : String
    init(text:String,correctAnswer:Bool) {
        answer = correctAnswer
        questionText = text
    }
    
}
//let que1 = Question(text: "", correctAnswer: )
