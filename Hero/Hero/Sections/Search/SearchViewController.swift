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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = darkGrey
        
        setupNavigationBar()
    }
    func setupNavigationBar() {
        let leftButton: UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 20))
        leftButton.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        leftButton.tintColor = .white
        leftButton.contentVerticalAlignment = .fill
        leftButton.contentHorizontalAlignment = .fill
        leftButton.addTarget(self, action: #selector(backButton), for: .touchUpInside)
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftButton)
    }
    @objc func backButton() {
        dismiss(animated: true, completion: nil)
    }
}
