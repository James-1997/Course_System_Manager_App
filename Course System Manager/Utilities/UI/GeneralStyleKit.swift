//
//  GeneralStyleKit.swift
//  Course System Manager
//
//  Created by Robson James Junior on 23/11/19.
//  Copyright © 2019 DilzanaKeise. All rights reserved.
//

import Foundation
import UIKit

struct GeneralSK {
    struct Colors {
        static let backGroundLoginColor = UIColor(red: 74, green: 197, blue: 195)
        static let buttonColor = UIColor(red: 42, green: 139, blue: 175)
        static let tintTilteColor = elementsInterativeColor
        static let borderColor = UIColor(red: 151, green: 151, blue: 151).cgColor
        static let elementsInterativeColor = UIColor(red: 235, green: 250, blue: 246)
        static let subtitlesColor = UIColor(red: 93, green: 90, blue: 90)
    }
    struct Sizes {
        static let brandSize: CGFloat = 220
        static let brandMarginToTop: CGFloat = 100
        static let buttonMargin: CGFloat = 50
        static let buttonCornerRadius: CGFloat = 26
        static let buttonHeight: CGFloat = 52
        static let differenceBettwenButtons: CGFloat = 24
        static let marginToBottom: CGFloat = 100
        static let marginToTextField: CGFloat = 32
        static let textFieldHeight: CGFloat = 45
        static let cornerRadiusTextField: CGFloat = 10
        static let borderWidthTextField: CGFloat = 1
        static let spacingBettwenTFandBt: CGFloat = 56
        static let infoLabelLeftMargin: CGFloat = 50
        static let infoLabelTopDistance: CGFloat = 16
    }
    struct Texts {
        static let titleToActionText: String = "Selecione seu perfil:"
        static let buttonStudentText: String = "Aluno"
        static let buttonTeacherText: String = "Professor"
        static let imageNameLogoBrand: String = "brand"
        static let systemIconNameLock: String = "lock.circle"
        static let systemIconNameOpenLock: String = "lock.open"
        static let systemIconNamePerson: String = "person.crop.circle"
        static let emailTextFieldPlaceHolder: String = "e-mail"
        static let passWordTextFieldPlaceHolder: String = "senha"
        static let logInText: String = "Entrar"
        static let confirmButtonText: String = "OK"
        static let errorTryAgainTitleText: String = "Resultado não encontrado! \n \(tryAgain)"
        static let tryAgain: String = "Tente Novamente!"
        static let errorTitle: String = "ERROR"
        static let logInSuccededTitle: String = "Login Feito"
        static let templateMessageSuccedLogin: String = "Login Realizado com sucesso"
        static let dontCompletEmail: String = "Erro no preenchimento de campos"
        static let dontCompletPassword: String = "Erro no preenchimento de campos"
        static let incompletPasswordMessage: String = "O campo Senha é obrigatório!"
        static let incompletEmailMessage: String = "O campo Email é obrigatório!"
        static let infoLabelText: String = "Selecione o seu perfil:"
        static let errorLoginTitle: String = "Resultado não encontrado"
        static let errorLoginMessage: String = "Nenhum registro encontrado!"
        static let characterTitle: String = "Erro no preenchimento de campos"
        static let characterPasswordBMessage: String = "O campo senha não pode ter mais de 30 caracteres!"
        static let characterPasswordSMessage: String = "O campo senha não pode ter menos de 8 caracteres!"
        static let characterEmailBMessage: String = "O campo email não pode ter mais de 30 caracteres!"
        static let characterEmailSMessage: String = "O campo email não pode ter menos de 8 caracteres!"
        static let incorrectEmail: String = "O campo Email não é um endereço de email válido!"
        static let incorrectPassword: String = "O campo de preenchimento está incorreto!"
         static let incorrectEmailMessage: String = "O campo Email não é um endereço de email válido"
        static let dontCanSpaceInpassword: String = "A senha não pode conter espaço"
    }
    struct Font {
        static let generalSubtitle = UIFont(name: "Lato-Bold", size: 24)
    }
}
