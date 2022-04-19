//
//  SearchViewController.swift
//  Hero
//
//  Created by Usr_Prime on 19/04/22.
//

import UIKit

class SearchViewController: UIViewController {

    let lightgrey = UIColor(red: 0.15, green: 0.15, blue: 0.15, alpha: 1.00)
    let darkGrey = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1.00)
    
    lazy var searchTextField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.placeholder = "Type here..."
        textField.layer.cornerRadius = 5
        textField.backgroundColor = .white
        textField.font = textField.font?.withSize(22)
        textField.autocapitalizationType = UITextAutocapitalizationType.none
        textField.textColor = darkGrey
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = darkGrey
        
        setupNavigationBar()
        setupView()
        setupConstraints()
    }
    private func setupNavigationBar() {
        let leftButton: UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 20))
        leftButton.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        leftButton.tintColor = .white
        leftButton.contentVerticalAlignment = .fill
        leftButton.contentHorizontalAlignment = .fill
        leftButton.addTarget(self, action: #selector(backButton), for: .touchUpInside)
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftButton)
        
        self.navigationItem.title = "Search Hero"
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: UIFont(name: "Chalkduster", size: self.view.frame.height/32)!
        ]
    }
    private func setupView() {
        view.addSubview(searchTextField)
    }
    private func setupConstraints() {
        let searchTextFieldConstraints = [
            searchTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: self.view.frame.width/4),
            searchTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            searchTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            searchTextField.heightAnchor.constraint(equalToConstant: self.view.frame.height/15)
        ]
        NSLayoutConstraint.activate(searchTextFieldConstraints)
    }
    @objc func backButton() {
        dismiss(animated: true, completion: nil)
    }
}
