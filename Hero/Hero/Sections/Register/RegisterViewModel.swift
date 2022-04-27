//
//  RegisterViewModel.swift
//  Hero
//
//  Created by Usr_Prime on 07/04/22.
//

import UIKit
import CoreData

protocol RegisterViewDelegate: AnyObject {
    func showAlertInName(with message: String)
    func showAlertInEmail(with message: String)
    func showAlertInPassword(with message: String)
    func setTextFieldsToDefault()
    func dismissPage()
}

class RegisterViewModel {
    var delegate: RegisterViewDelegate?
    private var canRegister = true
    
    func registerButtonsClick(name: String?, email: String?, password: String?, image: UIImage) {
        guard let name = name, let email = email, let password = password else { return }
        self.delegate?.setTextFieldsToDefault()
        canRegister = true
        
        validateName(with: name)
        validateEmail(with: email)
        validatePassword(with: password)
        
        if !canRegister { return }
        
        let attributes = generateKeychainAttributes(name, email, password)
        if registerUserOnKeychain(attributes) {
            savePerfilUser(email: email, image: image) { result in
                switch result {
                case .success(let finished): if finished { self.delegate?.dismissPage() }
                case .failure(let error): print(error)
                }
            }
        } else {
            self.delegate?.showAlertInEmail(with: "Email ja cadastrado")
        }
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
    func generateKeychainAttributes(_ name: String, _ email: String, _ password: String) -> [String: Any] {
        return [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: name,
            kSecAttrAccount as String: email,
            kSecValueData as String: password.data(using: .utf8) as Any,
        ]
    }
    func registerUserOnKeychain(_ user: [String:Any]) -> Bool {
        return SecItemAdd(user as CFDictionary, nil) == noErr
    }
}

extension RegisterViewModel {
    private func savePerfilUser(email: String, image: UIImage, completion: @escaping (Result<Bool, Error>) -> ()) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "PerfilUser", in: managedContext)!
        let user = NSManagedObject(entity: entity, insertInto: managedContext)
        user.setValue(UUID(), forKey: "identifier")
        user.setValue(image, forKey: "image")
        user.setValue(email, forKey: "email")
        
        do {
            try managedContext.save()
            completion(.success(true))
        } catch {
            completion(.failure(error))
        }
    }
}
