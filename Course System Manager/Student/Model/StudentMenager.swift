//
//  StudentMenager.swift
//  Course System Manager
//
//  Created by Robson James Junior on 24/11/19.
//  Copyright © 2019 DilzanaKeise. All rights reserved.
//

import Foundation

class StudentManager {
    private static var privateShared: StudentManager?
    private(set) var student: Student?
    class var shared: StudentManager {
        guard let uwShared = privateShared else {
            privateShared = StudentManager()
            return privateShared!
        }
        return uwShared
    }
    @objc class func destroy() {
        privateShared = nil
    }
    private init() {
        student = nil
    }
    public func getStudent(email: String, password: String) {
        RestUtils.getStudent(email: email, password: password, completionHandler: { (student) in
            self.student = nil
            guard student != nil else {
                return
            }
            self.student = student
            NotificationCenter.default.post(name: .studentChaged, object: self.student)
        })
    }
}
