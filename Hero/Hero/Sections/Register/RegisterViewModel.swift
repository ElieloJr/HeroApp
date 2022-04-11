//
//  RegisterViewModel.swift
//  Hero
//
//  Created by Usr_Prime on 07/04/22.
//

import UIKit

protocol RegisterViewDelegate: AnyObject {
    func showAlertInName(with message: String)
    func showAlertInEmail(with message: String)
    func showAlertInPassword(with message: String)
    func setTextFieldsToDefault()
}

class RegisterViewModel {
    var delegate: RegisterViewDelegate?
    private var canRegister = true
    
    func registerButtonsClick(name: String?, email: String?, password: String?) {
        guard let name = name, let email = email, let password = password else { return }
        self.delegate?.setTextFieldsToDefault()
        canRegister = true
        
        validateName(with: name)
        validateEmail(with: email)
        validatePassword(with: password)
        
        if !canRegister { return }
        
        // TODO: Processo de cadastro
    }
    private func validateName(with name: String) {
        if name == "" || name.count < 3 {
            canRegister = false
            self.delegate?.showAlertInName(with: "At least 3 letters")
        }
    }
    private func validateEmail(with email: String) {
        if email == "" || !isValidFormatEmail(email){
            canRegister = false
            self.delegate?.showAlertInEmail(with: "Invalid email")
        }
    }
    private func validatePassword(with password: String) {
        if password == "" || password.count < 8 {
            canRegister = false
            self.delegate?.showAlertInPassword(with: "At least 8 characters")
        }
    }
    private func isValidFormatEmail(_ email: String) -> Bool{
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    func generateKeychainAttributes(name: String, email: String, password: String, image: String) -> [String: Any] {
        return [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: name,
            kSecAttrAccount as String: email,
            kSecValueData as String: password.data(using: .utf8) as Any,
            kSecAttrDescription as String: image,
        ]
    }
    func registerUserOnKeychain(_ user: [String:Any]) -> Bool {
        return SecItemAdd(user as CFDictionary, nil) == noErr
    }
}
