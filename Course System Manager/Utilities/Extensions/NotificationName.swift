//
//  NotificationName.swift
//  Course System Manager
//
//  Created by Robson James Junior on 24/11/19.
//  Copyright © 2019 DilzanaKeise. All rights reserved.
//

import Foundation

extension Notification.Name {
    static let teacherChaged = Notification.Name("teacherChaged")
    static let studentChaged = Notification.Name("studentChaged")
    static let studentError = Notification.Name("studentError")
    static let teacherError = Notification.Name("teacherError")
}
