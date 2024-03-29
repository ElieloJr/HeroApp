//
//  HomeViewController.swift
//  Hero
//
//  Created by Usr_Prime on 11/04/22.
//

import UIKit

class HomeViewController: UIViewController {

    let lightgrey = UIColor(red: 0.15, green: 0.15, blue: 0.15, alpha: 1.00)
    let darkGrey = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1.00)
    let moreLightgrey = UIColor(red: 0.60, green: 0.60, blue: 0.60, alpha: 1.00)
    
    lazy var favoritesLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Favorites"
        label.textColor = .white
        label.font = label.font.withSize(view.frame.width/20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var favoriteHeroTableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.backgroundColor = darkGrey
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        tableView.register(FavoriteTableViewCell.self, forCellReuseIdentifier: FavoriteTableViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    let viewModel = HomeViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = darkGrey
        
        setNavigationItem()
        setupView()
        setupConstraints()
    }
    override var preferredStatusBarStyle: UIStatusBarStyle { return .lightContent }
    
    lazy var leftButton: UIButton = {
        let leftButton: UIButton = UIButton()
        leftButton.setImage(UIImage(systemName: "person.fill"), for: .normal)
        leftButton.tintColor = .white
        leftButton.backgroundColor = lightgrey
        leftButton.contentVerticalAlignment = .fill
        leftButton.contentHorizontalAlignment = .fill
        leftButton.layer.cornerRadius = 10
        leftButton.addTarget(self, action: #selector(exitButton), for: .touchUpInside)
        leftButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            leftButton.widthAnchor.constraint(equalToConstant: 50),
            leftButton.heightAnchor.constraint(equalToConstant: (navigationController?.navigationBar.frame.height)!)
        ])
        return leftButton
    }()
    func setNavigationItem() {
        let rightButton: UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: 45, height: 40))
        rightButton.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        rightButton.tintColor = .white
        rightButton.contentVerticalAlignment = .fill
        rightButton.contentHorizontalAlignment = .fill
        rightButton.addTarget(self, action: #selector(searchButton), for: .touchUpInside)
        
        let leftItem = UIBarButtonItem(customView: leftButton)
        let rightItem = UIBarButtonItem(customView: rightButton)
        self.navigationItem.leftBarButtonItem = leftItem
        self.navigationItem.rightBarButtonItem = rightItem
        
        self.navigationItem.title = "My Hero"
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: UIFont(name: "Chalkduster", size: self.view.frame.height/30)!
        ]
    }
    func setupView() {
        favoriteHeroTableView.delegate = self
        favoriteHeroTableView.dataSource = self
        
        viewModel.fetch()
        viewModel.delegate = self
        
        view.addSubview(favoritesLabel)
        view.addSubview(favoriteHeroTableView)
    }
    func setupConstraints() {
        let favoritesLabelConstraints = [
            favoritesLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: self.view.frame.height/7),
            favoritesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: self.view.frame.width/15)
        ]
        let favoriteHeroTableViewConstraints = [
            favoriteHeroTableView.topAnchor.constraint(equalTo: favoritesLabel.bottomAnchor, constant: 20),
            favoriteHeroTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            favoriteHeroTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            favoriteHeroTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        NSLayoutConstraint.activate(favoritesLabelConstraints)
        NSLayoutConstraint.activate(favoriteHeroTableViewConstraints)
    }
    
    @objc func exitButton() {
        dismiss(animated: true, completion: nil)
    }
    @objc func searchButton() {
        let searchController = UINavigationController(rootViewController: SearchViewController())
        searchController.modalPresentationStyle = .fullScreen
        present(searchController, animated: true)
    }
    @objc func refreshData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.favoriteHeroTableView.refreshControl?.endRefreshing()
            self.favoriteHeroTableView.refreshControl?.isHidden = true
            self.viewModel.fetch()
            self.favoriteHeroTableView.reloadData()
        }
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.fetchPerfilImage()
        return viewModel.favorites.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FavoriteTableViewCell.identifier, for: indexPath) as! FavoriteTableViewCell
        cell.configureView(with: viewModel.favorites[indexPath.row])
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.height/4.2
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailController = DetailViewController()
        let rootDetailController = UINavigationController(rootViewController: detailController)
        detailController.viewModel.favoriteHero = viewModel.favorites[indexPath.row]
        present(rootDetailController, animated: true)
    }
}

extension HomeViewController: HomeViewDelegate {
    func setUserImage(with image: UIImage) {
        leftButton.setImage(image, for: .normal)
        leftButton.layer.cornerRadius = 8
        leftButton.layer.masksToBounds = true
    }
}
