//
//  NoFoundTableViewCell.swift
//  Hero
//
//  Created by Usr_Prime on 22/04/22.
//

import UIKit

class NoFoundTableViewCell: UITableViewCell {
    static let identifier = "NoFoundTableViewCell"
    
    let lightgrey = UIColor(red: 0.15, green: 0.15, blue: 0.15, alpha: 1.00)
    let darkGrey = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1.00)
    
    lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "exclamationmark.circle")
        imageView.tintColor = lightgrey
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.text = "No hero found!"
        label.textColor = lightgrey
        label.numberOfLines = 2
        label.font = label.font.withSize(contentView.frame.width/10)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = darkGrey
        
        addSubview(iconImageView)
        addSubview(messageLabel)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        let iconImageViewConstraints = [
            iconImageView.topAnchor.constraint(equalTo: contentView.centerYAnchor),
            iconImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            iconImageView.widthAnchor.constraint(equalToConstant: contentView.frame.width/5),
            iconImageView.heightAnchor.constraint(equalToConstant: contentView.frame.width/5)
        ]
        let messageLabelConstraints = [
            messageLabel.centerYAnchor.constraint(equalTo: iconImageView.centerYAnchor),
            messageLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 10),
            messageLabel.widthAnchor.constraint(equalToConstant: (contentView.frame.width/4)*3)
        ]
        
        NSLayoutConstraint.activate(iconImageViewConstraints)
        NSLayoutConstraint.activate(messageLabelConstraints)
    }
}
