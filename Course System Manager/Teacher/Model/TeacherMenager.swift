//
//  TeacherMenager.swift
//  Course System Manager
//
//  Created by Robson James Junior on 24/11/19.
//  Copyright © 2019 DilzanaKeise. All rights reserved.
//

import Foundation

class TeacherManager {
    //Singleton Professor Gerenciador que controla os requerimentos referente ao objeto primitivo 
    private static var privateShared: TeacherManager?
    private(set) var teacher: Teacher?
    class var shared: TeacherManager {
        guard let uwShared = privateShared else {
            privateShared = TeacherManager()
            return privateShared!
        }
        return uwShared
    }
    @objc class func destroy() {
        privateShared = nil
    }
    private init() {
        teacher = nil
    }
    public func getTeacher(email: String, password: String) { //solicitação da API rest
        RestUtils.getTeacher(email: email, password: password, completionHandler: { (teacher) in
            self.teacher = nil
            guard teacher != nil else {
                return
            }
            self.teacher = teacher
            NotificationCenter.default.post(name: .teacherChaged, object: self.teacher)
        })
    }
}
