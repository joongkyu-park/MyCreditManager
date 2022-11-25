//
//  OutputView.swift
//  MyCreditManager
//
//  Created by Apple on 2022/11/25.
//

import Foundation

class OutputView {
    
    func printForDesiredFunction() {
        print("원하는 기능을 입력해주세요.\n1: 학생추가, 2: 학생삭제, 3: 성적추가(변경), 4: 성적삭제, 5: 평점보기, X: 종료")
    }
    
    func printForInvalidInput() {
        print("잘못된 입력입니다. 1~5 사이의 숫자 혹은 X를 입력해주세요.")
    }
    
    //MARK: - 학생 추가
    func printForAddingStudent() {
        print("추가할 학생의 이름을 입력해주세요.")
    }
    
    func printForCompletionAddingStudent(studentName: String) {
        print("\(studentName) 학생을 추가했습니다.")
    }
    
    func printForDuplicatedStudent(studentName: String) {
        print("\(studentName)은 이미 존재하는 학생입니다. 추가하지 않습니다.")
    }
    
    //MARK: - 학생 삭제
    func printForDeletingStudent() {
        print("삭제할 학생의 이름을 입력해주세요.")
    }
    
    func printForNonexistentStudent(studentName: String) {
        print("\(studentName) 학생을 찾지 못했습니다.")
    }
    
    //MARK: - 성적 추가
    func printForAddingSubject() {
        print("성적을 추가할 학생의 이름, 과목 이름, 성적(A+, A, ..., F)을 띄어쓰기로 구분하여 차례로 입력해주세요.\n입력 예) Mickey Swift A+\n만약에 학생 성적 중 해당 과목이 존재한다면 기존 점수가 갱신됩니다.")
    }
    
    func printForCompletionAddingSubject(studentName: String, subjectName: String, scoreString: String) {
        print("\(studentName) 학생의 \(subjectName) 과목이 \(scoreString)로 추가(변경)되었습니다.")
    }
    
    //MARK: - 성적 삭제
    func printForDeletingSubject() {
        print("성적을 삭제할 학생의 이름, 과목 이름, 성적을 띄어쓰기로 구분하여 차례로 입력해주세요.\n입력 예) Mickey Swift")
    }
    
    func printForCompletionDeletingSubject(studentName: String, subjectName: String) {
        print("\(studentName) 학생의 \(subjectName) 과목의 성적이 삭제되었습니다.")
    }
    
    //MARK: - 평점보기
    func printForGrade() {
        print("평점을 알고 싶은 학생의 이름을 입력해주세요.")
    }
    
    func printGrade(studentName: String, subjectScoreList: [(String, String)], grade: Double) {
        print(studentName)
        for subjectScore in subjectScoreList {
            print("\(subjectScore.0): \(subjectScore.1)\n")
        }
        print("평점: \(grade)")
    }
    
    //MARK: - 종료
    func printForTermination() {
        print("프로그램을 종료합니다...")
    }
}
