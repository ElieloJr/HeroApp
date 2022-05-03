//
//  ResultTableViewCell.swift
//  Hero
//
//  Created by Usr_Prime on 19/04/22.
//

import UIKit

class ResultTableViewCell: UITableViewCell {
    static let identifier = "ResultTableViewCell"
    
    let lightgrey = UIColor(red: 0.15, green: 0.15, blue: 0.15, alpha: 1.00)
    let darkGrey = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1.00)
    let moreLightgrey = UIColor(red: 0.60, green: 0.60, blue: 0.60, alpha: 1.00)
    
    lazy var characterImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.backgroundColor = lightgrey
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    lazy var fullNameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Full name"
        label.font = label.font.withSize(contentView.frame.width/18)
        label.textColor = moreLightgrey
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var characterNameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Character Name"
        label.font = UIFont(name: "Chalkduster", size: contentView.frame.width/11)
        label.textColor = .white
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 2
        
        let attributedString = NSMutableAttributedString(string: label.text!)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.maximumLineHeight = contentView.frame.width/10.2
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedString.length))
        
        label.attributedText = attributedString
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var editoraLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Publisher"
        label.textColor = darkGrey
        label.font = UIFont.systemFont(ofSize: contentView.frame.width/20, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var editoraView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = lightgrey
        view.layer.cornerRadius = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(editoraLabel)
        let editoraLabelConstraints = [
            editoraLabel.topAnchor.constraint(equalTo: view.topAnchor),
            editoraLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            editoraLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        NSLayoutConstraint.activate(editoraLabelConstraints)
        return view
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = darkGrey
        
        addSubview(characterImageView)
        addSubview(fullNameLabel)
        addSubview(characterNameLabel)
        addSubview(editoraView)
    }
    override func layoutSubviews() {
        let characterImageViewConstraints = [
            characterImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            characterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: contentView.frame.width/22),
            characterImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            characterImageView.heightAnchor.constraint(equalToConstant: contentView.frame.height-10),
            characterImageView.widthAnchor.constraint(equalToConstant: contentView.frame.width/3)
        ]
        let fullNameLabelConstraints = [
            fullNameLabel.bottomAnchor.constraint(equalTo: characterNameLabel.topAnchor, constant: -5),
            fullNameLabel.leadingAnchor.constraint(equalTo: characterImageView.trailingAnchor, constant: contentView.frame.width/30)
        ]
        let characterNameLabelConstraints = [
            characterNameLabel.centerYAnchor.constraint(equalTo: characterImageView.centerYAnchor, constant: 5),
            characterNameLabel.leadingAnchor.constraint(equalTo: characterImageView.trailingAnchor, constant: contentView.frame.width/30),
            characterNameLabel.widthAnchor.constraint(equalToConstant: (contentView.frame.width/5)*2.75)
        ]
        let editoraViewConstraints = [
            editoraView.topAnchor.constraint(equalTo: characterNameLabel.bottomAnchor),
            editoraView.leadingAnchor.constraint(equalTo: characterNameLabel.leadingAnchor),
            editoraView.heightAnchor.constraint(equalToConstant: contentView.frame.height/7),
            editoraView.widthAnchor.constraint(equalToConstant: contentView.frame.width/3)
        ]
        
        NSLayoutConstraint.activate(characterImageViewConstraints)
        NSLayoutConstraint.activate(characterNameLabelConstraints)
        NSLayoutConstraint.activate(fullNameLabelConstraints)
        NSLayoutConstraint.activate(editoraViewConstraints)
    }
    func configureView(with hero: Details) {
        characterNameLabel.text = hero.name
        fullNameLabel.text = hero.biography.fullName
        editoraLabel.text = hero.biography.publisher
        guard let imageURL = URL(string: hero.image.url) else { return }
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: imageURL) else { return }
            let imageEnd = UIImage(data: imageData)
            DispatchQueue.main.async {
                self.characterImageView.image = imageEnd
            }
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
