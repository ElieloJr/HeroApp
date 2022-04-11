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
    var canEnter = true
    
    func enterButtonsClick(_ email: String?, _ password: String?) {
        self.delegate?.setTextFieldsToDefault()
        guard let email = email, let password = password else { return }
        canEnter = true
        
        verifyFieldEmail(with: email)
        verifyFieldPassword(with: password)
        
        if !canEnter { return }
        
        if let existingItem = getUserBy(email: email) {
            if validateEmail(email, userData: existingItem) && validatePassword(password, userData: existingItem) {
                self.delegate?.goToHomeView()
            } else {
                self.delegate?.alertDataNoFound()
            }
        } else {
            self.delegate?.alertDataNoFound()
        }
    }
    func registerButtonClick() {
        self.delegate?.goToRegisterView()
    }
    
    private func verifyFieldEmail(with email: String) {
        if email == ""  {
            self.delegate?.setEmailToRed()
            canEnter = false
        }
    }
    private func verifyFieldPassword(with password: String) {
        if password == "" {
            self.delegate?.setPasswordToRed()
            canEnter = false
        }
    }
    private func getUserBy(email: String) -> [String: Any]? {
        var item: CFTypeRef?
        if SecItemCopyMatching(makeQuery(email) as CFDictionary, &item) == noErr {
            return item as? [String: Any]
        } else { return nil }
    }
    private func makeQuery(_ element: String) -> [String : Any]{
         return [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: element,
            kSecMatchLimit as String: kSecMatchLimitOne,
            kSecReturnAttributes as String: true,
            kSecReturnData as String: true,
         ]
    }
    private func validateEmail(_ email: String, userData:[String: Any]) -> Bool {
        if let id = userData[kSecAttrAccount as String] as? String {
            return email == id
        } else {
            return false
        }
    }
    private func validatePassword(_ userPassword: String, userData:[String: Any]) -> Bool {
        if let password = userData[kSecValueData as String] as? Data {
            return password == userPassword.data(using: .utf8)
        } else {
            return false
        }
    }
}
