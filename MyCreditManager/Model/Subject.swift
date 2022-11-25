//
//  Subject.swift
//  MyCreditManager
//
//  Created by Apple on 2022/11/25.
//

import Foundation

class Subject {
    private let name: String
    private var score: Score
    
    init(name: String, score: Score) {
        self.name = name
        self.score = score
    }
    
    func getName() -> String {
        return self.name
    }
    
    func getScore() -> Score {
        return self.score
    }
    
    func updateScore(score: Score) {
        self.score = score
    }
}
