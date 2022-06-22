//
//  BankServicesManager.swift
//  ExceptionHandlingApp
//
//  Created by Madhav Kure on 19/06/22.
//

import Foundation
class BankServices:BankServicesProtocol{
    
    var accountBalance:Int = 0
    var atmMachineAvlCash:Int = 0
    
    init(accountBalance:Int,atmMachineAvlCash:Int) {
        self.accountBalance = accountBalance
        self.atmMachineAvlCash = atmMachineAvlCash
    }
    
    func withDrawCash(amount: Int) throws {
        
        var reqeustedAmt = amount
        guard atmMachineAvlCash - amount >= 0 else{
            reqeustedAmt = 0
            throw BankAccount.LowCash
        }
        
        guard accountBalance - reqeustedAmt >= 0 else{
            reqeustedAmt = 0
            throw BankAccount.insufficientFunds
        }
        
        accountBalance -= reqeustedAmt
        atmMachineAvlCash -= reqeustedAmt
        
        print("WithDraw Amount Successfully:\(reqeustedAmt) Requested Amount: \(reqeustedAmt) Remaning Bal:\(accountBalance) ATM Availabe Cash: \(atmMachineAvlCash)")
    }
    
    func balanceEnquiry() throws {
    }
    
    func miniStatement() throws {
    }
    
    func pinChange(oldPin: Int, newPin: Int) throws {
    }
    
    func cardBlock(cardNumber: String) throws {
    }
    
    func enquiry(titile: String) throws {
    }
}
