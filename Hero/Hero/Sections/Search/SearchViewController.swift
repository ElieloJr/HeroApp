//
//  SearchViewController.swift
//  Hero
//
//  Created by Usr_Prime on 19/04/22.
//

import UIKit

class SearchViewController: UIViewController {

    let darkGrey = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1.00)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = darkGrey
    }
    override var preferredStatusBarStyle: UIStatusBarStyle { return .lightContent }
}
