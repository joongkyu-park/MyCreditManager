//
//  Controller.swift
//  MyCreditManager
//
//  Created by Apple on 2022/11/25.
//

import Foundation

class Controller {
    private let outputView = OutputView()
    private let inputView = InputView()
    private let inputValidator = InputValidator()
    private var studentList = StudentList()
    
    func startApplication() {
        while true {
            outputView.printForDesiredFunction()
            let input = inputView.receiveInput()
            if inputValidator.validateInitialInput(input: input) == false {
                outputView.printForInvalidInput()
                continue
            }
            //학생 추가
            if input == "1" {
                outputView.printForAddingStudent()
                let studentName = inputView.receiveInput()
                if inputValidator.validateInput(input: studentName) == false {
                    outputView.printForInvalidInput()
                    continue
                }
                do {
                    try studentList.addStudent(studentName: studentName)
                } catch let error as MyCreditManagerError {
                    outputView.printErrorDescription(description: error.rawValue)
                    continue
                } catch {
                    outputView.printUnknownError()
                    continue
                }
                outputView.printForCompletionAddingStudent(studentName: studentName)
                continue
            }
            //학생 삭제
            else if input == "2" {
                outputView.printForDeletingStudent()
                let studentName = inputView.receiveInput()
                if inputValidator.validateInput(input: studentName) == false {
                    outputView.printForInvalidInput()
                    continue
                }
                do {
                    try studentList.deleteStudent(studentName: studentName)
                } catch let error as MyCreditManagerError {
                    outputView.printErrorDescription(description: error.rawValue)
                    continue
                } catch {
                    outputView.printUnknownError()
                    continue
                }
                outputView.printForCompletionDeletingStudent(studentName: studentName)
                continue
            }
            //성적 추가/변경
            else if input == "3" {
                outputView.printForAddingSubject()
                let input = inputView.receiveInput().split(separator: " ").map{ String($0) }
                if input.count != 3 {
                    outputView.printForInvalidInput()
                    continue
                }
                let studentName = input[0]
                let subjectName = input[1]
                let scoreString = input[2]
                
                if inputValidator.validateInput(input: studentName) == false {
                    outputView.printForInvalidInput()
                    continue
                }
                let scoreList = Score.allCases.map{ $0.description }
                if !scoreList.contains(scoreString) {
                    outputView.printForInvalidInput()
                    continue
                }
                guard let score = Score(description: scoreString) else { outputView.printForInvalidInput()
                    continue
                }
                do {
                    try studentList.updateSubject(studentName: studentName, subjectName: subjectName, score: score)
                } catch let error as MyCreditManagerError {
                    outputView.printErrorDescription(description: error.rawValue)
                    continue
                } catch {
                    outputView.printUnknownError()
                    continue
                }
                outputView.printForCompletionAddingSubject(studentName: studentName, subjectName: subjectName, scoreString: scoreString)
                continue
            }
            //성적 삭제
            else if input == "4" {
                outputView.printForDeletingSubject()
                let input = inputView.receiveInput().split(separator: " ").map{ String($0) }
                if input.count != 2 {
                    outputView.printForInvalidInput()
                    continue
                }
                let studentName = input[0]
                let subjectName = input[1]
                
                if inputValidator.validateInput(input: studentName) == false
                    || inputValidator.validateInput(input: subjectName) == false {
                    outputView.printForInvalidInput()
                    continue
                }
                do {
                    try studentList.deleteSubject(studentName: studentName, subjectName: subjectName)
                } catch let error as MyCreditManagerError {
                    outputView.printErrorDescription(description: error.rawValue)
                    continue
                } catch {
                    outputView.printUnknownError()
                    continue
                }
                outputView.printForCompletionDeletingSubject(studentName: studentName, subjectName: subjectName)
                continue
            }
            //평점 보기
            else if input == "5" {
                outputView.printForGrade()
                let studentName = inputView.receiveInput()
                if inputValidator.validateInput(input: studentName) == false {
                    outputView.printForInvalidInput()
                    continue
                }
                do {
                    let result = try studentList.getGrade(studentName: studentName)
                    let grade = result.0
                    let subjectsWithScore = result.1.map{($0.getName(), $0.getScore().description)}
                    outputView.printGrade(studentName: studentName,
                                          subjectScoreList: subjectsWithScore,
                                          grade: grade)
                } catch let error as MyCreditManagerError {
                    outputView.printErrorDescription(description: error.rawValue)
                    continue
                } catch {
                    outputView.printUnknownError()
                    continue
                }
                continue
            }
            //종료
            else if input == "X" {
                outputView.printForTermination()
                break
            }
        }
    }
}
