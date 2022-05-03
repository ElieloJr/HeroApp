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
    let moreLightgrey = UIColor(red: 0.60, green: 0.60, blue: 0.60, alpha: 1.00)
    
    lazy var searchTextField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.placeholder = "Type here..."
        textField.layer.cornerRadius = 5
        textField.backgroundColor = .white
        textField.font = textField.font?.withSize(22)
        textField.autocapitalizationType = UITextAutocapitalizationType.none
        textField.returnKeyType = .search
        textField.delegate = self
        textField.textColor = darkGrey
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    lazy var searchButton: UIButton = {
        var button = UIButton(frame: .zero)
        button.setTitle("Search", for: .normal)
        button.titleLabel?.font = button.titleLabel?.font.withSize(20)
        button.backgroundColor = .red
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(doSearchButton), for: .touchUpInside)
        return button
    }()
    lazy var resultLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Results:"
        label.textColor = moreLightgrey
        label.font = label.font.withSize(view.frame.width/20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var resultsTableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.backgroundColor = darkGrey
        tableView.register(ResultTableViewCell.self, forCellReuseIdentifier: ResultTableViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = darkGrey
        resultsTableView.delegate = self
        resultsTableView.dataSource = self
        
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
        view.addSubview(searchButton)
        view.addSubview(resultLabel)
        view.addSubview(resultsTableView)
    }
    private func setupConstraints() {
        let searchTextFieldConstraints = [
            searchTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: self.view.frame.width/4),
            searchTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            searchTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            searchTextField.heightAnchor.constraint(equalToConstant: self.view.frame.height/15)
        ]
        let searchButtonConstraints = [
            searchButton.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 10),
            searchButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            searchButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            searchButton.heightAnchor.constraint(equalToConstant: self.view.frame.height/15)
        ]
        let resultLabelConstraints = [
            resultLabel.topAnchor.constraint(equalTo: searchButton.bottomAnchor, constant: 24),
            resultLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ]
        let resultsTableViewConstraints = [
            resultsTableView.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 20),
            resultsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            resultsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            resultsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(searchTextFieldConstraints)
        NSLayoutConstraint.activate(searchButtonConstraints)
        NSLayoutConstraint.activate(resultLabelConstraints)
        NSLayoutConstraint.activate(resultsTableViewConstraints)
    }
    @objc func doSearchButton() {
        print("Funciona")
    }
    @objc func backButton() {
        dismiss(animated: true, completion: nil)
    }
}

extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.height/4
    }
}

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ResultTableViewCell.identifier, for: indexPath) as! ResultTableViewCell
        cell.selectedBackgroundView = .none
        return cell
    }
}

extension SearchViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        doSearchButton()
        return true
    }
}
