//
//  MyCreditManagerError.swift
//  MyCreditManager
//
//  Created by Apple on 2022/11/25.
//

import Foundation

enum MyCreditManagerError: String, Error {
    case noSubject = "해당 과목이 존재하지 않습니다.\n"
    case noStudent = "해당 학생이 존재하지 않습니다.\n"
    case duplicatedStudent = "해당 학생이 이미 존재합니다.\n"
    case hasNotAnySubjects = "해당 학생이 아무런 과목 성적을 가지고 있지 않습니다.\n"
}
