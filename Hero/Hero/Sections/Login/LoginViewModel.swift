//
//  LoginViewModel.swift
//  Hero
//
//  Created by Usr_Prime on 05/04/22.
//

import UIKit

protocol LoginViewDelegate: AnyObject {
    func setEmailToRed()
    func setPasswordToRed()
    func setTextFieldsToDefault()
    func alertDataNoFound()
    func goToHomeView()
    func goToRegisterView()
}

class LoginViewModel {
    var delegate: LoginViewDelegate?
    
    func enterButtonsClick(_ email: String?, _ password: String?) {
        self.delegate?.setTextFieldsToDefault()
        guard let email = email, let password = password else { return }
        if email == ""  {
            self.delegate?.setEmailToRed()
        }
        if password == "" {
            self.delegate?.setPasswordToRed()
        }
        //self.delegate?.goToHomeView()
    }
    func registerButtonClick() {
        print("Se pá registra")
        //self.delegate?.goToRegisterView()
    }
}
