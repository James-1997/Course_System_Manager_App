//
//  RestUtils.swift
//  Course System Manager
//
//  Created by Robson James Junior on 23/11/19.
//  Copyright © 2019 DilzanaKeise. All rights reserved.
//

import Foundation
import CoreLocation

class RestUtils {
    static var baseUrl: String = "https://us-central1-course-manager-system.cloudfunctions.net/api"
    enum OperationClient: String {
        case searchStudent
        case seachTeacher

        var routersUrl: String {
            switch self {
            case .searchStudent:
                return "\(RestUtils.baseUrl)/students/%@/%@"
            case .seachTeacher:
                return "\(RestUtils.baseUrl)/teachers/%@/%@"
            }
        }
    }
    enum HttpMethods: String {
        case getData = "GET"
        case postData = "POST"
        case putData = "PUT"
    }
    static public func postTo(routerUrl: URL,
                              body: Data?,
                              completionHandler: ((_ data: Data?, _ error: Error?) -> Void)?) {
        self.makeRequest(routerUrl: routerUrl,
                         method: .postData,
                         body: body,
                         completionHandler: completionHandler)
    }
    static public func getFrom(routerUrl: URL,
                               completionHandler: ((_ data: Data?, _ error: Error?) -> Void)?) {
        self.makeRequest(routerUrl: routerUrl,
                         method: .getData,
                         body: nil,
                         completionHandler: completionHandler)
    }
    static public func putTo(routerUrl: URL,
                             body: Data?,
                             completionHandler:((_ data: Data?, _ error: Error?) -> Void)?) {
        self.makeRequest(routerUrl: routerUrl,
                         method: .putData,
                         body: body,
                         completionHandler: completionHandler)
    }
    static private func makeRequest(routerUrl: URL,
                                    method: HttpMethods,
                                    body: Data?,
                                    completionHandler: ((_ data: Data?, _ error: Error?) -> Void)?) {
        var request = URLRequest(url: routerUrl)
        request.httpMethod = method.rawValue
        request.httpBody = body
        let session = URLSession.shared
        session.dataTask(with: request) { (data, _, error) in
            if error != nil {
                completionHandler?(data, error)
            } else {
                completionHandler?(data, nil)
            }
        }.resume()
    }
    static public func getTeacher(email: String,
                                  password: String,
                                  completionHandler: @escaping ((_ data: Teacher?) -> Void)) {
        let operation: OperationClient = .seachTeacher
        guard let routerUrl = URL(string: String(format: operation.routersUrl, email, password)) else {
               return completionHandler(nil)
           }
           self.getFrom(routerUrl: routerUrl) { (data, error) in
               if let data = data {
                   do {
                       let teacher = try JSONDecoder().decode(Teacher.self, from: data)
                       completionHandler(teacher)
                   } catch let jsonError {
                       print("Error 1: \(jsonError.localizedDescription)")
                       completionHandler(nil)
                   }
               } else if let error = error {
                   print("Error 2: \(error.localizedDescription)")
                   completionHandler(nil)
               }
           }
       }
    static public func getStudent(email: String,
                                  password: String,
                                  completionHandler: @escaping ((_ data: Student?) -> Void)) {
        let operation: OperationClient = .searchStudent
        guard let routerUrl = URL(string: String(format: operation.routersUrl, email, password)) else {
               return completionHandler(nil)
           }
           self.getFrom(routerUrl: routerUrl) { (data, error) in
               if let data = data {
                   do {
                       let student = try JSONDecoder().decode(Student.self, from: data)
                       completionHandler(student)
                   } catch let jsonError {
                       print("Error 3: \(jsonError.localizedDescription)")
                       completionHandler(nil)
                   }
               } else if let error = error {
                   print("Error 4: \(error.localizedDescription)")
                   completionHandler(nil)
               }
           }
       }
}
