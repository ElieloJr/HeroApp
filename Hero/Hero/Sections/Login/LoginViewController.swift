//
//  ViewController.swift
//  Hero
//
//  Created by Usr_Prime on 04/04/22.
//

import UIKit

class LoginViewController: KeyboardViewController {

    let viewModel = LoginViewModel()
    let primaryColor = UIColor(red: 0.15, green: 0.15, blue: 0.15, alpha: 1.00)
    let secundaryColor = UIColor(red: 0.60, green: 0.60, blue: 0.60, alpha: 1.00)
    
    lazy var imageView: UIImageView = {
        let image = UIImageView(frame: .zero)
        image.image = UIImage(named: "heros")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    lazy var contentView: UIView = {
        let contentView = UIView(frame: .zero)
        contentView.backgroundColor = primaryColor
        contentView.layer.cornerRadius = 30
        contentView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        contentView.layer.masksToBounds = true
        contentView.addSubview(titleLabel)
        contentView.addSubview(emailLabel)
        contentView.addSubview(emailTextField)
        contentView.addSubview(passwordLabel)
        contentView.addSubview(passwordTextField)
        contentView.addSubview(enterButton)
        contentView.addSubview(alertLabel)
        contentView.addSubview(registerButton)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        let titleLabelConstraints = [
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 14),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ]
        let emailLabelConstraints = [
            emailLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: self.view.frame.height/30),
            emailLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20)
        ]
        let emailTextFieldConstraints = [
            emailTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            emailTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 2),
            emailTextField.heightAnchor.constraint(equalToConstant: self.view.frame.height/15)
        ]
        let passwordLabelConstraints = [
            passwordLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 16)
        ]
        let passwordTextFieldConstraints = [
            passwordTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 2),
            passwordTextField.heightAnchor.constraint(equalToConstant: self.view.frame.height/15)
        ]
        let enterButtonConstraints = [
            enterButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            enterButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            enterButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: self.view.frame.height/28),
            enterButton.heightAnchor.constraint(equalToConstant: self.view.frame.height/15)
        ]
        let alertLabelConstraints = [
            alertLabel.topAnchor.constraint(equalTo: enterButton.bottomAnchor, constant: 4),
            alertLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            alertLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ]
        let registerButtonConstraints = [
            registerButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            registerButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            registerButton.heightAnchor.constraint(equalToConstant: self.view.frame.height/15),
            registerButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -(self.view.frame.height/20))
        ]
        NSLayoutConstraint.activate(titleLabelConstraints)
        NSLayoutConstraint.activate(emailLabelConstraints)
        NSLayoutConstraint.activate(emailTextFieldConstraints)
        NSLayoutConstraint.activate(passwordLabelConstraints)
        NSLayoutConstraint.activate(passwordTextFieldConstraints)
        NSLayoutConstraint.activate(enterButtonConstraints)
        NSLayoutConstraint.activate(alertLabelConstraints)
        NSLayoutConstraint.activate(registerButtonConstraints)
        return contentView
    }()
    lazy var titleLabel: UILabel = {
        let title = UILabel(frame: .zero)
        title.text = "My Hero"
        title.textColor = .white
        title.font = UIFont(name: "Chalkduster", size: self.view.frame.height/14)
        title.textAlignment = .center
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    lazy var emailLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Email:"
        label.textColor = secundaryColor
        label.font = label.font.withSize(18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var passwordLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Password:"
        label.textColor = secundaryColor
        label.font = label.font.withSize(18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var alertLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.isHidden = true
        label.text = "Check your details or register"
        label.textColor = .white
        label.font = label.font.withSize(15)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
       return label
    }()
    lazy var emailTextField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.layer.borderWidth = 0
        textField.layer.borderColor = UIColor.red.cgColor
        textField.layer.cornerRadius = 5
        textField.backgroundColor = .white
        textField.font = textField.font?.withSize(22)
        textField.textColor = UIColor.black
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    lazy var passwordTextField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.layer.borderWidth = 0
        textField.layer.borderColor = UIColor.red.cgColor
        textField.layer.cornerRadius = 5
        textField.backgroundColor = .white
        textField.font = textField.font?.withSize(25)
        textField.textColor = UIColor.black
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    lazy var enterButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitle("Enter", for: .normal)
        button.titleLabel?.font = button.titleLabel?.font.withSize(20)
        button.backgroundColor = .red
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(actionEnterButton), for: .touchUpInside)
        return button
    }()
    lazy var registerButton: UIButton = {
        var button = UIButton(frame: .zero)
        button.setTitle("Register", for: .normal)
        button.titleLabel?.font = button.titleLabel?.font.withSize(20)
        button.backgroundColor = secundaryColor
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(actionRegisterButton), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        view.backgroundColor = UIColor(red: 0.15, green: 0.15, blue: 0.15, alpha: 0.60)
        
        setupView()
        setupConstraints()
    }
    override var preferredStatusBarStyle: UIStatusBarStyle { return .lightContent }
    
    func setupView() {
        view.addSubview(imageView)
        view.addSubview(contentView)
    }
    
    func setupConstraints() {
        let imageViewConstraints = [
            imageView.topAnchor.constraint(equalTo: self.view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: (self.view.frame.height/3)+30)
        ]
        let contentViewConstraints = [
            contentView.heightAnchor.constraint(equalToConstant: (self.view.frame.height/3)*2),
            contentView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ]
        NSLayoutConstraint.activate(imageViewConstraints)
        NSLayoutConstraint.activate(contentViewConstraints)
    }
    
    @objc func actionEnterButton() {
        self.viewModel.enterButtonsClick(emailTextField.text, passwordTextField.text)
    }
    @objc func actionRegisterButton() {
        self.viewModel.registerButtonClick()
    }
}

extension LoginViewController: LoginViewDelegate {
    func setTextFieldsToDefault() {
        emailTextField.layer.borderWidth = 0
        passwordTextField.layer.borderWidth = 0
        alertLabel.isHidden = true
    }
    func setEmailToRed() {
        emailTextField.layer.borderWidth = 3
    }
    func setPasswordToRed() {
        self.passwordTextField.layer.borderWidth = 3
    }
    func alertDataNoFound() {
        alertLabel.isHidden = false
    }
    func goToHomeView() {
        //navigationController?.pushViewController(<#T##viewController: UIViewController##UIViewController#>, animated: true)
    }
    func goToRegisterView() {
        //navigationController?.pushViewController(<#T##viewController: UIViewController##UIViewController#>, animated: true)
    }
}
