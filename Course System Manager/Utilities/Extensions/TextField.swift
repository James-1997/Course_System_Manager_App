//
//  TextField.swift
//  Course System Manager
//
//  Created by Robson James Junior on 23/11/19.
//  Copyright © 2019 DilzanaKeise. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    func setIcon(_ image: UIImage) {
        let iconView = UIImageView(frame:
            CGRect(x: 10, y: 5, width: 20, height: 20))
        iconView.image = image
        let iconContainerView: UIView = UIView(frame:
            CGRect(x: 20, y: 0, width: 30, height: 30))
        iconContainerView.addSubview(iconView)
        leftView = iconContainerView
        leftViewMode = .always
    }
    func setSystemIcon(_ imageName: String) {
        guard let image = UIImage(systemName: imageName) else { return
        }
        let iconView = UIImageView(frame:
            CGRect(x: 10, y: 5, width: 20, height: 20))
        iconView.image = image
        let iconContainerView: UIView = UIView(frame:
            CGRect(x: 20, y: 0, width: 30, height: 30))
        iconContainerView.addSubview(iconView)
        leftView = iconContainerView
        leftViewMode = .always
        tintColor =  UIColor.lightGray
    }
}
