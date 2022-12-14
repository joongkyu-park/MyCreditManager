//
//  StudentList.swift
//  MyCreditManager
//
//  Created by Apple on 2022/11/25.
//

import Foundation

class StudentList {
    private var students: [Student] = []
    
    func addStudent(studentName: String) throws {
        for student in students {
            if student.getName() == studentName {
                throw MyCreditManagerError.duplicatedStudent
            }
        }
        let student = Student(name: studentName)
        students.append(student)
    }
    
    func deleteStudent(studentName: String) throws {
        for (index, student) in students.enumerated() {
            if student.getName() == studentName {
                students.remove(at: index)
                return
            }
        }
        throw MyCreditManagerError.noStudent
    }
    
    func addSubject(studentName: String, subjectName: String, score: Score) throws {
        for student in students {
            if student.getName() == studentName {
                student.addSubject(subjectName: subjectName, score: score)
                return
            }
        }
        throw MyCreditManagerError.noStudent
    }
    
    func deleteSubject(studentName: String, subjectName: String) throws {
        for student in students {
            if student.getName() == studentName {
                try student.deleteSubject(subjectName: subjectName)
                return
            }
        }
        throw MyCreditManagerError.noStudent
    }
    
    func updateSubject(studentName: String, subjectName: String, score: Score) throws {
        for student in students {
            if student.getName() == studentName {
                try student.updateSubject(subjectName: subjectName, score: score)
                return
            }
        }
        throw MyCreditManagerError.noStudent
    }
    
    func getGrade(studentName: String) throws -> (Double, [Subject]) {
        for student in students {
            if student.getName() == studentName {
                if student.getAllSubjects().isEmpty {
                    throw MyCreditManagerError.hasNotAnySubjects
                }
                let grade = student.getGrade()
                let subjects = student.getAllSubjects()
                return (grade, subjects)
            }
        }
        throw MyCreditManagerError.noStudent
    }
}
