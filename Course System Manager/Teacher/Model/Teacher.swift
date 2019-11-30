//
//  Teacher.swift
//  Course System Manager
//
//  Created by Robson James Junior on 24/11/19.
//  Copyright © 2019 DilzanaKeise. All rights reserved.
//

import Foundation
import UIKit

class Teacher: Decodable {
    public let email: String
    public let password: String
    public let active: Bool
    enum CodingKeys: String, CodingKey {
        case email, password,  active
    }
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        email = try container.decode(String.self, forKey: .email)
        password = try container.decode(String.self, forKey: .password)
        active = try container.decode(Bool.self, forKey: .active)
    }
}
