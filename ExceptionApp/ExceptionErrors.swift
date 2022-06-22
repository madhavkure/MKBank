//
//  ExceptionErrors.swift
//  ExceptionHandlingApp
//
//  Created by Madhav Kure on 17/06/22.
//

import Foundation

enum BankAccount:Error{
    case insufficientFunds
    case invalidTransaction
    case duplicateTransaction
    case unknown
    case DispenserError
    case NoReceiptPaper
    case ConnectionError
    case LowCash
    case InvalidPin
}

enum BiometricAuthentication:String, Error{
    case LAErrorUserCancel = "Authentication canceled." //LAErrorUserFallback if user tapped the fallback button
    case LAErrorUserFallback //LAErrorUserCancel if user has tapped the Cancel button
    case LAErrorSystemCancel //LAErrorSystemCancel if some system event interrupted the evaluation (e.g. Home butto pressed).
}
