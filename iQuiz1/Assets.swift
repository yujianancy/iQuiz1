//
//  Assets.swift
//  iQuiz1
//
//  Created by iGuest on 11/7/15.
//  Copyright © 2015 Jia Yu. All rights reserved.
//

import Foundation
import UIKit

class subject{
    var title:String
    var description:String
    var image:UIImage
    var questions:[question]
    
    init(title: String, description:String, imageName: String, questions:[question]){
        self.title = title
        self.description = description
        self.image = UIImage(named: imageName)!
        self.questions = questions
    }
}

class question{
    var text:String
    var optionTxt:[String]
    var answer:Int
    
    init(text:String, optionTxt:[String], answer:Int){
        self.text = text
        self.optionTxt = optionTxt
        self.answer = answer
    }
}

var qm1 = question(text: "What is Wolverine’s real name?", optionTxt: ["Nick Fury","James","William","Victor"], answer: 1)

var qm2 = question(text: "Why was Steve Rogers rejected by the Army?", optionTxt: ["Frail and wek","Too young","Too old","No reason"], answer: 0)

var qm3 = question(text: "This hero was born with one gift and was experimented on to gain another.", optionTxt: ["Logan","Steve Rogers","Bruce Banner","Ant Man"], answer: 0)

var qs1 = question(text: "Brass gets discoloured in air because of the presence of which of the following gases in air?", optionTxt: ["Oxygen","Hydrogen sulphide","Carbon dioxide","Nitrogen"], answer: 1)

var qs2 = question(text: "Which of the following is a non metal that remains liquid at room temperature?", optionTxt: ["Phosphorous","Chlorine","Helium","Bromine"], answer: 3)

var qs3 = question(text: "Chlorophyll is a naturally occurring chelate compound in which central metal is", optionTxt: ["copper","magnesium","iron","calcium"], answer: 1)

var qma1 = question(text: "What is 1 + 3?", optionTxt: ["4","3","2","7"], answer: 0)

var qma2 = question(text: "What is 6 * 8?", optionTxt: ["14","12","48","32"], answer: 2)

var qma3 = question(text: "What is 16 / 2?", optionTxt: ["2","4","6","8"], answer: 3)

var marvel = subject(title: "Marvel Heroes", description: "Test whether you're a real marvel fan!", imageName: "marvel", questions: [qm1,qm2,qm3])

var science = subject(title: "Science", description: "Test whether you're a real science geek!", imageName: "science", questions: [qs1,qs2,qs3])

var maths = subject(title: "Mathematics", description: "Test whether you're a real maths maniac!", imageName: "maths", questions: [qma1,qma2,qma3])

var subjects:[subject] = [marvel, science, maths]