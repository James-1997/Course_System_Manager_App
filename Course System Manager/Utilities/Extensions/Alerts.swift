//
//  Alerts.swift
//  Course System Manager
//
//  Created by Robson James Junior on 24/11/19.
//  Copyright © 2019 DilzanaKeise. All rights reserved.
//

import UIKit
import Foundation

extension UIViewController {
    func showAlert(title: String,
                   message: String,
                   buttonTitle: String,
                   style: UIAlertAction.Style) {
        let alert = UIAlertController(title: title,
                                      message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: buttonTitle,
                                      style: style,
                                      handler: nil))
        self.present(alert,
                     animated: true,
                     completion: nil)
    }
}
