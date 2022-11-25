//
//  MyCreditManagerError.swift
//  MyCreditManager
//
//  Created by Apple on 2022/11/25.
//

import Foundation

enum MyCreditManagerError: String, Error {
    case noSubject = "해당 과목이 존재하지 않습니다."
    case noStudent = "해당 학생이 존재하지 않습니다."
    case invalidInput = "입력이 올바르지 않습니다."
}
