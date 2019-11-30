//
//  ViewController.swift
//  Course System Manager
//
//  Created by Robson James Junior on 21/11/19.
//  Copyright © 2019 DilzanaKeise. All rights reserved.
//

import UIKit
import Stevia

class TeacherLoginViewControler: UIViewController { //Controller na qual administra as ações do app
    //Abaixo os elementos de UI
    private let emailTextField = UITextField()
    private let passWordTextField = UITextField()
    private let brandImageLogo = UIImageView()
    private let logInButton = UIButton(type: .system)
    private var teacherMenager = TeacherManager.shared
    private let spinner = SpinnerViewController.shared
    //viewDidLoad() - Função que carrega a tela
    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit() //iniciador de configurações da tela
        addObservers() //observadores de feedbacks
    }
    //abaixo funções de teclado
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey]
            as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    private func commonInit() {
        subviews() //hierarquia
        layout() //regras de posições
        theme() //customizações
    }
    //configurações de hierarquia
    private func subviews() {
        view.sv(brandImageLogo)
        view.sv(emailTextField)
        view.sv(passWordTextField)
        view.sv(logInButton)
    }
    //Configurações de posições
    private func layout() {
        brandImageLogo.centerHorizontally()
        brandImageLogo.Top == view.safeAreaLayoutGuide.Top + GeneralSK.Sizes.brandMarginToTop
        brandImageLogo.size(GeneralSK.Sizes.brandSize)
        emailTextField.centerHorizontally()
        emailTextField.fillHorizontally(m: GeneralSK.Sizes.marginToTextField)
        emailTextField.Height == GeneralSK.Sizes.textFieldHeight
        emailTextField.Top == brandImageLogo.Bottom + 35
        passWordTextField.centerHorizontally()
        passWordTextField.fillHorizontally(m: GeneralSK.Sizes.marginToTextField)
        passWordTextField.Height == GeneralSK.Sizes.textFieldHeight
        passWordTextField.Top == emailTextField.Bottom + 25
        logInButton.centerHorizontally()
        logInButton.Top == passWordTextField.Bottom + GeneralSK.Sizes.spacingBettwenTFandBt
        logInButton.fillHorizontally(m: GeneralSK.Sizes.buttonMargin)
        logInButton.Height == GeneralSK.Sizes.buttonHeight
    }
    //Configurações de customização
    private func theme() {
        view.backgroundColor = GeneralSK.Colors.backGroundLoginColor
        emailTextField.setSystemIcon(GeneralSK.Texts.systemIconNamePerson)
        emailTextField.textAlignment = .left
        emailTextField.backgroundColor = GeneralSK.Colors.tintTilteColor
        emailTextField.clipsToBounds = true
        emailTextField.layer.cornerRadius = GeneralSK.Sizes.cornerRadiusTextField
        emailTextField.layer.borderWidth = GeneralSK.Sizes.borderWidthTextField
        emailTextField.layer.borderColor = GeneralSK.Colors.borderColor
        passWordTextField.setSystemIcon(GeneralSK.Texts.systemIconNameLock)
        passWordTextField.backgroundColor = GeneralSK.Colors.tintTilteColor
        passWordTextField.clipsToBounds = true
        passWordTextField.layer.cornerRadius = GeneralSK.Sizes.cornerRadiusTextField
        passWordTextField.layer.borderColor = GeneralSK.Colors.borderColor
        passWordTextField.layer.borderWidth = GeneralSK.Sizes.borderWidthTextField
        passWordTextField.textAlignment = .left
        passWordTextField.isSecureTextEntry = true
        logInButton.backgroundColor = GeneralSK.Colors.buttonColor
        logInButton.setTitle(GeneralSK.Texts.logInText, for: .normal)
        logInButton.setTitleColor(GeneralSK.Colors.tintTilteColor, for: .normal)
        logInButton.clipsToBounds = true
        logInButton.layer.cornerRadius = GeneralSK.Sizes.buttonCornerRadius
        logInButton.backgroundColor = GeneralSK.Colors.buttonColor
        logInButton.titleLabel?.font = GeneralSK.Font.generalSubtitle
        emailTextField.textColor = GeneralSK.Colors.subtitlesColor
        passWordTextField.textColor = GeneralSK.Colors.subtitlesColor
        logInButton.addTarget(self,
                              action: #selector(handleLogInToShow),
                              for: .touchUpInside)
        configTextField()
    }
    //Configurações de TextField
    func configTextField() {
        let image = searchImage(imageName: GeneralSK.Texts.imageNameLogoBrand)
        brandImageLogo.image = image
        passWordTextField.attributedPlaceholder =
            NSAttributedString(string: GeneralSK.Texts.passWordTextFieldPlaceHolder,
                               attributes:
                [NSAttributedString.Key.foregroundColor :
                                GeneralSK.Colors.subtitlesColor
                                ])
        emailTextField.attributedPlaceholder =
        NSAttributedString(string:
            GeneralSK.Texts.emailTextFieldPlaceHolder,
                           attributes:
            [NSAttributedString.Key.foregroundColor :
                            GeneralSK.Colors.subtitlesColor])
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
    func createSpinnerView() {
        addChild(spinner)
        spinner.view.frame = view.frame
        view.addSubview(spinner.view)
        spinner.didMove(toParent: self)
    }
    func destroySpinner () {
        DispatchQueue.main.async {
            self.spinner.willMove(toParent: nil)
            self.spinner.view.removeFromSuperview()
            self.spinner.removeFromParent()
        }
    }
    @objc
    private func viewTapped(gestureRecognizer: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
    //Análise dos comportamentos de preenchimento do TextField de login
    @objc func handleLogInToShow () {
        emailTextField.resignFirstResponder()
        passWordTextField.resignFirstResponder()
        guard let email = emailTextField.text else {
            dontHaveEmailText()
            return
        }
        if email == "" {
            dontHaveEmailText()
            return
        }
        if email.count > 30 || email.count < 8 {
            characterUnlimite()
            return
        }
        if !(email.contains("@") && email.numberOfOccurrences("@") == 1) {
            emailDenied()
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
        if password.count > 30 || password.count < 8 {
            characterUnlimite()
            return
        }
        teacherMenager.getTeacher(email: email, password: password)
        createSpinnerView()
    }
    //mensagens em pop-up
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
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(presentTeacherData),
                                               name: .teacherChaged,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(teacherErrorLogIn),
                                               name: .teacherError,
        object: nil)
    NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
    NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    @objc func presentTeacherData() {
        destroySpinner()
        guard let teacher = teacherMenager.teacher else {
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
    @objc func teacherErrorLogIn() {
        destroySpinner()
        DispatchQueue.main.async {
            self.showAlert(title: GeneralSK.Texts.errorLoginTitle,
                                      message: GeneralSK.Texts.errorLoginMessage,
                                      buttonTitle: GeneralSK.Texts.confirmButtonText,
                                      style: .default)
        }
    }
    func characterUnlimite() {
        self.showAlert(title: GeneralSK.Texts.characterTitle,
                       message: GeneralSK.Texts.characterMessage,
                       buttonTitle: GeneralSK.Texts.confirmButtonText,
                       style: .default)
    }
    func emailDenied() {
        self.showAlert(title:  GeneralSK.Texts.incorrectEmail,
                       message: GeneralSK.Texts.incorrectEmailMessage,
                       buttonTitle: GeneralSK.Texts.confirmButtonText,
                       style: .default)
    }
}
