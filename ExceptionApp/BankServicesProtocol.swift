//
//  BankServicesProtocol.swift
//  ExceptionHandlingApp
//
//  Created by Madhav Kure on 17/06/22.
//

import Foundation

protocol BankServicesProtocol{
    func withDrawCash(amount:Int)throws
    func balanceEnquiry()throws
    func miniStatement()throws
    func pinChange(oldPin:Int,newPin:Int)throws
    func cardBlock(cardNumber:String)throws
    func enquiry(titile:String)throws
}

