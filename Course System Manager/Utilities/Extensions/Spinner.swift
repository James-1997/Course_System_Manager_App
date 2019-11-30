//
//  Spinner.swift
//  Course System Manager
//
//  Created by Robson James Junior on 30/11/19.
//  Copyright © 2019 DilzanaKeise. All rights reserved.
//

import Foundation
import UIKit

class SpinnerViewController: UIViewController {
    var spinner = UIActivityIndicatorView(style: .large)
    private static var privateShared: SpinnerViewController?
    class var shared: SpinnerViewController {
        guard let uwShared = privateShared else {
            privateShared = SpinnerViewController()
            return privateShared!
        }
        return uwShared
    }
    @objc class func destroy() {
        privateShared = nil
    }
    override func loadView() {
        view = UIView()
        view.backgroundColor = UIColor(white: 0, alpha: 0.7)
        spinner.translatesAutoresizingMaskIntoConstraints = true
        spinner.startAnimating()
        spinner.color = #colorLiteral(red: 0.2881887555, green: 0.7739998102, blue: 0.7637454867, alpha: 1)
        view.sv(spinner)
        spinner.centerVertically()
        spinner.centerHorizontally()
    }
}
