//
//  Student.swift
//  MyCreditManager
//
//  Created by Apple on 2022/11/25.
//

import Foundation

class Student {
    private let name: String
    private var subjects: [Subject] = []
    
    init(name: String) {
        self.name = name
    }
    
    func getName() -> String {
        return self.name
    }
    
    func addSubject(subjectName: String, score: Score) {
        let subject = Subject(name: subjectName, score: score)
        subjects.append(subject)
    }
    
    func deleteSubject(subjectName: String) throws {
        for (index, subject) in subjects.enumerated() {
            if subject.getName() == subjectName {
                subjects.remove(at: index)
                return
            }
        }
        throw MyCreditManagerError.noSubject
    }
    
    func updateSubject(subjectName: String, score: Score) throws {
        for subject in subjects {
            if subject.getName() == subjectName {
                subject.updateScore(score: score)
                return
            }
        }
        throw MyCreditManagerError.noSubject
    }
    
    func getGrade() -> Double{
        var totalScore = 0.0
        for subject in subjects {
            totalScore += subject.getScore().rawValue
        }
        return totalScore / Double(subjects.count)
    }
    
    func getAllSubjects() -> [Subject] {
        return subjects
    }
}
