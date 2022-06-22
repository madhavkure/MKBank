//
//  AuthenticationViewController.swift
//  ExceptionHandlingApp
//
//  Created by Madhav Kure on 20/06/22.
//

import Foundation
import UIKit
import LocalAuthentication

class Authentication:UIViewController{
    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var passwordLbl: UILabel!
    @IBOutlet weak var userNameTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    
    var context = LAContext()
    var biometricsTryLimit:Int = 0
    var biometricsCurrentCount:Int = 0
    override func viewDidLoad() {
        biometricsTryLimit = 3
        biometricsCurrentCount = 1
        self.hideLoginView(isHide: true)
        self.authenticate()
    }
    func authenticate(){
        
        let context = LAContext()
        var error:NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error){
            let reason = "We need to unlock your passwords."
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason){
                success, authenticationError in
                DispatchQueue.main.async { [self] in
                    if success{
                        self.performSegue(withIdentifier: "authentication", sender: nil)
                    }else{
                        let nserror = authenticationError! as NSError
                        let errorkey = nserror.userInfo["NSLocalizedDescription"] as? String
                        if BiometricAuthentication.LAErrorUserCancel.rawValue == errorkey {
                            self.biometricsAlert()
                        }else{
                            guard biometricsTryLimit >= biometricsCurrentCount else{
                                return
                            }
                            self.biometricsCurrentCount += 1
                            self.authenticate()
                        }
                    }
                }
            }
        }else{
            self.hideLoginView(isHide: false)
        }
    }
    
    func biometricsAlert(){
        let alert = UIAlertController(title: "Biometrics", message: "Do You Login With User Name and Password", preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { UIAlertAction in
            self.hideLoginView(isHide: false)
        }
        let cancleAction = UIAlertAction(title: "No", style: UIAlertAction.Style.default) { UIAlertAction in
            exit(-1)
        }
        
        alert.addAction(okAction)
        alert.addAction(cancleAction)
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func hideLoginView(isHide:Bool){
        DispatchQueue.main.async {
            self.userNameLbl.isHidden = isHide
            self.passwordLbl.isHidden = isHide
            self.userNameTxt.isHidden = isHide
            self.passwordTxt.isHidden = isHide
            self.loginButton.isHidden = isHide
        }
    }
}
