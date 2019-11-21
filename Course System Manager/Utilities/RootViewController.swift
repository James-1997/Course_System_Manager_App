//
//  ViewController.swift
//  Course System Manager
//
//  Created by Robson James Junior on 21/11/19.
//  Copyright © 2019 DilzanaKeise. All rights reserved.
//

import UIKit
import Stevia

class RootViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
    }
    private func commonInit() {
        subviews()
        layout()
        theme()
    }
    private func subviews() {
    }
    private func layout() {
    }
    private func theme() {
        self.view.backgroundColor = .brown
    }
}
