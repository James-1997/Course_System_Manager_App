//
//  countElements.swift
//  Course System Manager
//
//  Created by Robson James Junior on 30/11/19.
//  Copyright © 2019 DilzanaKeise. All rights reserved.
//

import Foundation

extension String {
    public func numberOfOccurrences(_ string: String) -> Int {
        return components(separatedBy: string).count - 1
    }
}
