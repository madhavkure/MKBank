//
//  ViewController.swift
//  ExceptionApp
//
//  Created by Madhav Kure on 17/06/22.
//

import UIKit
import LocalAuthentication
class ViewController: UIViewController {
    
    @IBOutlet weak var withDrawField: UITextField?
    var accountBalance:Int = 0
    var atmMachineAvlCash:Int = 0
    var bankServices:BankServices?
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bankServices = BankServices(accountBalance: 10000, atmMachineAvlCash: 100000)
        self.navigationItem.setHidesBackButton(true, animated: true)

    }
    
    @IBAction func withDrawCashAction(_ sender: Any) {
        let amount:String?
        amount = withDrawField?.text
        var requestedAmt:Int = 0
        
        guard let validAmt = Int(amount!) else {
            return
        }
        requestedAmt = validAmt
        
        do{
            try bankServices?.withDrawCash(amount: requestedAmt)
        }
        catch BankAccount.insufficientFunds{
            print("Insufficient Funds")
        }
        catch BankAccount.LowCash {
            print("Cash Not Available")
            print("MK BANK:Cash Finished,Please Load The Cash: Area: Nigdi | ATM NO:101 | ATM CODE: MHP123456")
        }
        catch{
            print(error)
        }
    }
    
   // master change1
    
  // master change2
    
  // master change3
}

