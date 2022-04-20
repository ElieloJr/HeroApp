//
//  DetailViewController.swift
//  Hero
//
//  Created by Usr_Prime on 20/04/22.
//

import UIKit

class DetailViewController: UIViewController {
    
    let lightgrey = UIColor(red: 0.15, green: 0.15, blue: 0.15, alpha: 1.00)
    let darkGrey = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1.00)
    
    lazy var detailsScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    lazy var favoriteButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.tintColor = .white
        button.setTitle("   Add to Favorites", for: .normal)
        button.titleLabel?.font = button.titleLabel?.font.withSize(20)
        button.backgroundColor = lightgrey
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(addToFavoritesButton), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = darkGrey
        
        setupView()
        setupConstraints()
    }
    private func setupView() {
        view.addSubview(detailsScrollView)
        view.addSubview(favoriteButton)
    }
    private func setupConstraints() {
        let detailsScrollViewConstraints = [
            detailsScrollView.topAnchor.constraint(equalTo: view.topAnchor),
            detailsScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            detailsScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            detailsScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        let favoriteButtonConstraints = [
            favoriteButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -(self.view.frame.width/10)),
            favoriteButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: self.view.frame.width/5),
            favoriteButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -(self.view.frame.width/5)),
            favoriteButton.heightAnchor.constraint(equalToConstant:  self.view.frame.width/7.5)
        ]
        
        NSLayoutConstraint.activate(detailsScrollViewConstraints)
        NSLayoutConstraint.activate(favoriteButtonConstraints)
    }
    @objc func addToFavoritesButton() {
        favoriteButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
    }
}
