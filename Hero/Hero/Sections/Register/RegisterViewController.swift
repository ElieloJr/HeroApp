//
//  RegisterViewController.swift
//  Hero
//
//  Created by Usr_Prime on 07/04/22.
//

import UIKit

class RegisterViewController: UIViewController {
    
    let lightgrey = UIColor(red: 0.15, green: 0.15, blue: 0.15, alpha: 1.00)
    let darkGrey = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1.00)
    let moreLightgrey = UIColor(red: 0.60, green: 0.60, blue: 0.60, alpha: 1.00)
    
    lazy var viewBackground: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = lightgrey
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var perfilImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.backgroundColor = darkGrey
        imageView.image = UIImage(systemName: "person.fill")
        imageView.tintColor = .lightGray
        imageView.layer.borderWidth = 7
        imageView.layer.borderColor = lightgrey.cgColor
        imageView.layer.cornerRadius = view.frame.width/10
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    lazy var setImageButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.backgroundColor = lightgrey
        button.layer.cornerRadius = 10
        button.setImage(UIImage(systemName: "camera.rotate"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(actionSetImageButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    lazy var nameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Name:"
        label.textColor = moreLightgrey
        label.font = label.font.withSize(view.frame.width/20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var nameTextField: UITextField = {
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

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.15, green: 0.15, blue: 0.15, alpha: 0.60)
        
        setupView()
        setupConstraints()
    }
    override var preferredStatusBarStyle: UIStatusBarStyle { return .lightContent }
    
    func setupView() {
        view.addSubview(viewBackground)
        view.addSubview(perfilImageView)
        view.addSubview(setImageButton)
        view.addSubview(nameLabel)
        view.addSubview(nameTextField)
    }
    func setupConstraints() {
        let viewBackgroundConstraints = [
            viewBackground.topAnchor.constraint(equalTo: view.topAnchor),
            viewBackground.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            viewBackground.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            viewBackground.heightAnchor.constraint(equalToConstant: ((view.frame.height/3)/3)*2)
        ]
        let perfilImageViewConstraints = [
            perfilImageView.topAnchor.constraint(equalTo: viewBackground.bottomAnchor, constant: -(view.frame.height/8)),
            perfilImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            perfilImageView.heightAnchor.constraint(equalToConstant: ((view.frame.height/3)/3)*2.2),
            perfilImageView.widthAnchor.constraint(equalToConstant: ((view.frame.height/3)/3)*2.2)
        ]
        let setImageButtonConstraints = [
            setImageButton.topAnchor.constraint(equalTo: viewBackground.bottomAnchor, constant: view.frame.height/35),
            setImageButton.centerXAnchor.constraint(equalTo: perfilImageView.trailingAnchor),
            setImageButton.heightAnchor.constraint(equalToConstant: view.frame.height/17),
            setImageButton.widthAnchor.constraint(equalToConstant: view.frame.width/8)
        ]
        let nameLabelConstraints = [
            nameLabel.topAnchor.constraint(equalTo: perfilImageView.bottomAnchor, constant: self.view.frame.height/30),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ]
        let nameTextFieldConstraints = [
            nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 2),
            nameTextField.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nameTextField.heightAnchor.constraint(equalToConstant: self.view.frame.height/15)
        ]
        NSLayoutConstraint.activate(viewBackgroundConstraints)
        NSLayoutConstraint.activate(perfilImageViewConstraints)
        NSLayoutConstraint.activate(setImageButtonConstraints)
        NSLayoutConstraint.activate(nameLabelConstraints)
        NSLayoutConstraint.activate(nameTextFieldConstraints)
    }
    
    @objc func actionSetImageButton() {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
}

extension RegisterViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage") ] as? UIImage {
            perfilImageView.image = image
            print(image)
        }
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
