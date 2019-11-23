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
    static let elementsInterativeColor = UIColor(red: 235, green: 250, blue: 246)
    static let subtitlesColor = UIColor(red: 93, green: 90, blue: 90)
    struct Colors {
        static let backGroundLoginColor = UIColor(red: 74, green: 197, blue: 195)
        static let buttonColor = UIColor(red: 42, green: 139, blue: 175)
        static let tintTilteColor = elementsInterativeColor
    }
    struct Sizes {
        static let brandSize: CGFloat = 220
        static let brandMarginToTop: CGFloat = 100
        static let buttonMargin: CGFloat = 50
        static let buttonCornerRadius: CGFloat = 26
        static let buttonHeight: CGFloat = 52
        static let differenceBettwenButtons: CGFloat = 24
        static let marginToBottom: CGFloat = 100
    }
    struct Texts {
        static let titleToActionText: String = "Selecione seu perfil:"
        static let buttonStudentText: String = "Aluno"
        static let buttonTeacherText: String = "Professor"
        static let imageNameLogoBrand: String = "brand"
    }
}
