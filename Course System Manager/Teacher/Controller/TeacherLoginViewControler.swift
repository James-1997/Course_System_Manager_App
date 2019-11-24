//
//  ViewController.swift
//  Course System Manager
//
//  Created by Robson James Junior on 21/11/19.
//  Copyright © 2019 DilzanaKeise. All rights reserved.
//

import UIKit
import Stevia

class TeacherLoginViewControler: UIViewController {
    private let emailTextField = UITextField()
    private let passWordTextField = UITextField()
    private let brandImageLogo = UIImageView()
    private let logInButton = UIButton(type: .system)
    private var teacherMenager = TeacherManager.self
    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
        addObservers()
    }
    private func commonInit() {
        subviews()
        layout()
        theme()
    }
    private func subviews() {
        view.sv(brandImageLogo)
        view.sv(emailTextField)
        view.sv(passWordTextField)
        view.sv(logInButton)
    }
    private func layout() {
        brandImageLogo.centerHorizontally()
        brandImageLogo.Top == view.safeAreaLayoutGuide.Top + GeneralSK.Sizes.brandMarginToTop
        brandImageLogo.size(GeneralSK.Sizes.brandSize)
        emailTextField.setSystemIcon(GeneralSK.Texts.systemIconNamePerson)
        emailTextField.centerHorizontally()
        emailTextField.fillHorizontally(m: GeneralSK.Sizes.marginToTextField)
        emailTextField.Height == GeneralSK.Sizes.textFieldHeight
        emailTextField.Top == brandImageLogo.Bottom + 35
        passWordTextField.centerHorizontally()
        passWordTextField.fillHorizontally(m: GeneralSK.Sizes.marginToTextField)
        passWordTextField.Height == GeneralSK.Sizes.textFieldHeight
        passWordTextField.Top == emailTextField.Bottom + 25
        passWordTextField.setSystemIcon(GeneralSK.Texts.systemIconNameLock)
        logInButton.centerHorizontally()
        logInButton.Top == passWordTextField.Bottom + GeneralSK.Sizes.spacingBettwenTFandBt
        logInButton.fillHorizontally(m: GeneralSK.Sizes.buttonMargin)
        logInButton.Height == GeneralSK.Sizes.buttonHeight
    }
    private func theme() {
        view.backgroundColor = GeneralSK.Colors.backGroundLoginColor
        emailTextField.textAlignment = .left
        emailTextField.textColor = GeneralSK.Colors.subtitlesColor
        emailTextField.backgroundColor = GeneralSK.Colors.tintTilteColor
        emailTextField.clipsToBounds = true
        emailTextField.layer.cornerRadius = GeneralSK.Sizes.cornerRadiusTextField
        emailTextField.layer.borderWidth = GeneralSK.Sizes.borderWidthTextField
        emailTextField.layer.borderColor = GeneralSK.Colors.borderColor
        emailTextField.placeholder = GeneralSK.Texts.emailTextFieldPlaceHolder
        passWordTextField.backgroundColor = GeneralSK.Colors.tintTilteColor
        passWordTextField.clipsToBounds = true
        passWordTextField.layer.cornerRadius = GeneralSK.Sizes.cornerRadiusTextField
        passWordTextField.layer.borderColor = GeneralSK.Colors.borderColor
        passWordTextField.layer.borderWidth = GeneralSK.Sizes.borderWidthTextField
        passWordTextField.textAlignment = .left
        passWordTextField.textColor = GeneralSK.Colors.subtitlesColor
        passWordTextField.placeholder = GeneralSK.Texts.passWordTextFieldPlaceHolder
        passWordTextField.isSecureTextEntry = true
        logInButton.backgroundColor = GeneralSK.Colors.buttonColor
        logInButton.setTitle(GeneralSK.Texts.logInText, for: .normal)
        logInButton.setTitleColor(GeneralSK.Colors.tintTilteColor, for: .normal)
        logInButton.clipsToBounds = true
        logInButton.layer.cornerRadius = GeneralSK.Sizes.buttonCornerRadius
        logInButton.backgroundColor = GeneralSK.Colors.buttonColor
        logInButton.addTarget(self,
                              action: #selector(handleLogInToShow),
                              for: .touchUpInside)
        let image = searchImage(imageName: GeneralSK.Texts.imageNameLogoBrand)
        brandImageLogo.image = image
    }
    private func searchImage(imageName:String) -> UIImage? {
        guard let image = UIImage(named: imageName) else {return nil}
        return image
    }
    private func configureGestures() {
        let tapGestureRecoginzer = UITapGestureRecognizer(target: self,
                                                          action: #selector(viewTapped(gestureRecognizer:)))
        self.view.addGestureRecognizer(tapGestureRecoginzer)
    }
    @objc
    private func viewTapped(gestureRecognizer: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
    @objc func handleLogInToShow () {
        guard let email = emailTextField.text else {
            dontHaveEmailText()
            return
        }
        if email == "" {
            dontHaveEmailText()
            return
        }
        guard let password = passWordTextField.text else {
            dontHavePasswordText()
            return
        }
        if password == "" {
            dontHavePasswordText()
            return
        }
        teacherMenager.shared.getTeacher(email: email, password: password)
    }
    func dontHaveEmailText() {
        self.showAlert(title: GeneralSK.Texts.dontCompletEmail,
                       message: GeneralSK.Texts.incompletEmailMessage,
                       buttonTitle: GeneralSK.Texts.confirmButtonText,
                       style: .default)
    }
    func dontHavePasswordText() {
        self.showAlert(title:  GeneralSK.Texts.dontCompletPassword,
                       message: GeneralSK.Texts.incompletPasswordMessage,
                       buttonTitle: GeneralSK.Texts.confirmButtonText,
                       style: .default)
    }
    private func addObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(presentTeacherData),
                                               name: .teacherChaged,
                                               object: nil)
    }
    @objc func presentTeacherData() {
        guard let teacher = teacherMenager.shared.teacher else {
            self.showAlert(title: GeneralSK.Texts.errorTitle,
                           message: GeneralSK.Texts.errorTryAgainTitleText,
                           buttonTitle: GeneralSK.Texts.confirmButtonText,
                           style: .default)
            return
        }
        DispatchQueue.main.async {
            self.showAlert(title: GeneralSK.Texts.logInSuccededTitle,
                           message: String(format: GeneralSK.Texts.templateMessageSuccedLogin,
                                           teacher.email,
                                           teacher.password),
                           buttonTitle: GeneralSK.Texts.confirmButtonText,
                           style: .default)
        }
    }
}
