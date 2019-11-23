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
    private let studentSelectButton = UIButton(type: .system)
    private let teacherSelectButton = UIButton(type: .system)
    private let brandImageLogo = UIImageView()
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
        view.sv(teacherSelectButton)
        view.sv(studentSelectButton)
        view.sv(brandImageLogo)
    }
    private func layout() {
        teacherSelectButton.centerHorizontally()
        teacherSelectButton.Bottom == view.safeAreaLayoutGuide.Bottom - GeneralSK.Sizes.marginToBottom
        teacherSelectButton.fillHorizontally(m: GeneralSK.Sizes.buttonMargin)
        teacherSelectButton.Height == GeneralSK.Sizes.buttonHeight
        studentSelectButton.centerHorizontally()
        studentSelectButton.Bottom == teacherSelectButton.Top - GeneralSK.Sizes.differenceBettwenButtons
        studentSelectButton.fillHorizontally(m: GeneralSK.Sizes.buttonMargin)
        studentSelectButton.Height == GeneralSK.Sizes.buttonHeight
        brandImageLogo.centerHorizontally()
        brandImageLogo.Top == view.safeAreaLayoutGuide.Top + GeneralSK.Sizes.brandMarginToTop
        brandImageLogo.size(GeneralSK.Sizes.brandSize)
    }
    private func theme() {
        view.backgroundColor = GeneralSK.Colors.backGroundLoginColor
        studentSelectButton.backgroundColor = GeneralSK.Colors.buttonColor
    studentSelectButton.setTitle(GeneralSK.Texts.buttonStudentText, for: .normal)
    studentSelectButton.setTitleColor(GeneralSK.Colors.tintTilteColor, for: .normal)
        studentSelectButton.clipsToBounds = true
        studentSelectButton.layer.cornerRadius = GeneralSK.Sizes.buttonCornerRadius
        teacherSelectButton.backgroundColor = GeneralSK.Colors.buttonColor
    teacherSelectButton.setTitle(GeneralSK.Texts.buttonTeacherText, for: .normal)
    teacherSelectButton.setTitleColor(GeneralSK.Colors.tintTilteColor, for: .normal)
        teacherSelectButton.clipsToBounds = true
        teacherSelectButton.layer.cornerRadius = GeneralSK.Sizes.buttonCornerRadius
        teacherSelectButton.addTarget(self,
                                      action: #selector(handleTouchTeacherProfiler),
                                      for: .touchUpInside)
        studentSelectButton.addTarget(self,
                                      action: #selector(handleTouchStudentProfile),
                                      for: .touchUpInside)
        guard let image = UIImage(named: GeneralSK.Texts.imageNameLogoBrand) else { return }
        brandImageLogo.image = image
    }
    @objc func handleTouchStudentProfile( ) {
        let studentVC = StudentLoginViewControler()
        studentVC.modalPresentationStyle = .fullScreen
        present(studentVC, animated: true)
    }
    @objc func handleTouchTeacherProfiler( ) {
        let teacherVC = TeacherLoginViewControler()
        teacherVC.modalPresentationStyle = .fullScreen
        present(teacherVC, animated: true)
    }
}
