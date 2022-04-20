//
//  DetailViewController.swift
//  Hero
//
//  Created by Usr_Prime on 20/04/22.
//

import UIKit

class DetailViewController: UIViewController {
    
    let lightgrey = UIColor(red: 0.15, green: 0.15, blue: 0.15, alpha: 1.00)
    let moreLightgrey = UIColor(red: 0.60, green: 0.60, blue: 0.60, alpha: 1.00)
    let darkGrey = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1.00)
    
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
        label.text = "Full Name:"
        label.font = label.font.withSize(view.frame.width/24)
        label.textColor = moreLightgrey
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var toFullNameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "..."
        label.font = label.font.withSize(view.frame.width/18)
        label.textColor = .white
        label.numberOfLines = 3
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var characterNameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Character Name:"
        label.font = label.font.withSize(view.frame.width/24)
        label.textColor = moreLightgrey
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var toCharacterNameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "..."
        label.font = UIFont(name: "Chalkduster", size: view.frame.width/12)
        label.textColor = .white
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 2
        let attributedString = NSMutableAttributedString(string: label.text!)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.maximumLineHeight = view.frame.width/10.2
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedString.length))
        label.attributedText = attributedString
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var powerstatsLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Power Stats:"
        label.font = label.font.withSize(view.frame.width/24)
        label.textColor = moreLightgrey
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var numberSmartLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textColor = darkGrey
        label.backgroundColor = moreLightgrey
        label.textAlignment = .center
        label.font = label.font.withSize(view.frame.width/18)
        label.layer.cornerRadius = 8
        label.layer.masksToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var smartSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.value = 0
        if slider.value == 100 { slider.maximumTrackTintColor = .red }
        slider.tintColor = lightgrey
        slider.minimumTrackTintColor = .red
        slider.thumbTintColor = .clear
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    lazy var SmartLabel: UILabel = {
        let label = UILabel()
        label.text = "Inteligence".uppercased()
        label.textColor = moreLightgrey
        label.textAlignment = .center
        label.font = label.font.withSize(view.frame.width/21)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var numberDurabilityLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textColor = darkGrey
        label.backgroundColor = moreLightgrey
        label.textAlignment = .center
        label.font = label.font.withSize(view.frame.width/18)
        label.layer.cornerRadius = 8
        label.layer.masksToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var durabilitySlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.value = 0
        if slider.value == 100 { slider.maximumTrackTintColor = .red }
        slider.tintColor = .red
        slider.minimumTrackTintColor = .red
        slider.thumbTintColor = .clear
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    lazy var durabilityLabel: UILabel = {
        let label = UILabel()
        label.text = "Durability".uppercased()
        label.textColor = moreLightgrey
        label.textAlignment = .center
        label.font = label.font.withSize(view.frame.width/21)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var numberStrengthLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textColor = darkGrey
        label.backgroundColor = moreLightgrey
        label.textAlignment = .center
        label.font = label.font.withSize(view.frame.width/18)
        label.layer.cornerRadius = 8
        label.layer.masksToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var strengthSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.value = 0
        if slider.value == 100 { slider.maximumTrackTintColor = .red }
        slider.tintColor = .red
        slider.minimumTrackTintColor = .red
        slider.thumbTintColor = .clear
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    lazy var strengthLabel: UILabel = {
        let label = UILabel()
        label.text = "Strength".uppercased()
        label.textColor = moreLightgrey
        label.textAlignment = .center
        label.font = label.font.withSize(view.frame.width/21)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var numberSpeedLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textColor = darkGrey
        label.backgroundColor = moreLightgrey
        label.textAlignment = .center
        label.font = label.font.withSize(view.frame.width/18)
        label.layer.cornerRadius = 8
        label.layer.masksToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var speedSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.value = 0
        if slider.value == 100 { slider.maximumTrackTintColor = .red }
        slider.tintColor = .red
        slider.minimumTrackTintColor = .red
        slider.thumbTintColor = .clear
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    lazy var speedLabel: UILabel = {
        let label = UILabel()
        label.text = "Speed".uppercased()
        label.textColor = moreLightgrey
        label.textAlignment = .center
        label.font = label.font.withSize(view.frame.width/21)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var numberCombatLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textColor = darkGrey
        label.backgroundColor = moreLightgrey
        label.textAlignment = .center
        label.font = label.font.withSize(view.frame.width/18)
        label.layer.cornerRadius = 8
        label.layer.masksToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var combatSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.value = 0
        if slider.value == 100 { slider.maximumTrackTintColor = .red }
        slider.tintColor = .red
        slider.minimumTrackTintColor = .red
        slider.thumbTintColor = .clear
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    lazy var combatLabel: UILabel = {
        let label = UILabel()
        label.text = "Combat".uppercased()
        label.textColor = moreLightgrey
        label.textAlignment = .center
        label.font = label.font.withSize(view.frame.width/21)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var numberPowerLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textColor = darkGrey
        label.backgroundColor = moreLightgrey
        label.textAlignment = .center
        label.font = label.font.withSize(view.frame.width/18)
        label.layer.cornerRadius = 8
        label.layer.masksToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var powerSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.value = 0
        if slider.value == 100 { slider.maximumTrackTintColor = .red }
        slider.tintColor = .red
        slider.minimumTrackTintColor = .red
        slider.thumbTintColor = .clear
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    lazy var powerLabel: UILabel = {
        let label = UILabel()
        label.text = "Power".uppercased()
        label.textColor = moreLightgrey
        label.textAlignment = .center
        label.font = label.font.withSize(view.frame.width/21)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var publisherLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Publisher:"
        label.font = label.font.withSize(view.frame.width/24)
        label.textColor = moreLightgrey
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var toPublisherLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "..."
        label.font = UIFont.boldSystemFont(ofSize: view.frame.width/18)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var raceLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Race:"
        label.font = label.font.withSize(view.frame.width/24)
        label.textColor = moreLightgrey
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var detailsScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        
        scrollView.addSubview(characterImageView)
        scrollView.addSubview(fullNameLabel)
        scrollView.addSubview(toFullNameLabel)
        scrollView.addSubview(characterNameLabel)
        scrollView.addSubview(toCharacterNameLabel)
        scrollView.addSubview(powerstatsLabel)
        
        scrollView.addSubview(numberSmartLabel)
        scrollView.addSubview(smartSlider)
        scrollView.addSubview(SmartLabel)
        
        scrollView.addSubview(numberDurabilityLabel)
        scrollView.addSubview(durabilitySlider)
        scrollView.addSubview(durabilityLabel)
        
        scrollView.addSubview(numberStrengthLabel)
        scrollView.addSubview(strengthSlider)
        scrollView.addSubview(strengthLabel)
        
        scrollView.addSubview(numberSpeedLabel)
        scrollView.addSubview(speedSlider)
        scrollView.addSubview(speedLabel)
        
        scrollView.addSubview(numberCombatLabel)
        scrollView.addSubview(combatSlider)
        scrollView.addSubview(combatLabel)
        
        scrollView.addSubview(numberPowerLabel)
        scrollView.addSubview(powerSlider)
        scrollView.addSubview(powerLabel)

        scrollView.addSubview(publisherLabel)
        scrollView.addSubview(toPublisherLabel)
        scrollView.addSubview(raceLabel)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        let characterImageViewConstraints = [
            characterImageView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: -(view.frame.width/15)),
            characterImageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: view.frame.width/25),
            characterImageView.widthAnchor.constraint(equalToConstant: view.frame.width/2.4),
            characterImageView.heightAnchor.constraint(equalToConstant: view.frame.width/1.6)
        ]
        let fullNameLabelConstraints = [
            fullNameLabel.topAnchor.constraint(equalTo: characterImageView.topAnchor),
            fullNameLabel.leadingAnchor.constraint(equalTo: characterImageView.trailingAnchor, constant: view.frame.width/25)
        ]
        let toFullNameLabelConstraints = [
            toFullNameLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor),
            toFullNameLabel.leadingAnchor.constraint(equalTo: fullNameLabel.leadingAnchor),
            toFullNameLabel.widthAnchor.constraint(equalToConstant: view.frame.width/2.1)
        ]
        let characterLabelConstraints = [
            characterNameLabel.topAnchor.constraint(equalTo: toFullNameLabel.bottomAnchor),
            characterNameLabel.leadingAnchor.constraint(equalTo: fullNameLabel.leadingAnchor)
        ]
        let toCharacterNameLabelConstraints = [
            toCharacterNameLabel.topAnchor.constraint(equalTo: characterNameLabel.bottomAnchor),
            toCharacterNameLabel.leadingAnchor.constraint(equalTo: fullNameLabel.leadingAnchor),
            toCharacterNameLabel.widthAnchor.constraint(equalToConstant: view.frame.width/2.05)
        ]
        let powerstatsLabelConstraints = [
            powerstatsLabel.topAnchor.constraint(equalTo: characterImageView.bottomAnchor, constant: 20),
            powerstatsLabel.leadingAnchor.constraint(equalTo: characterImageView.leadingAnchor),
        ]
        let numberSmartLabelConstraints = [
            numberSmartLabel.topAnchor.constraint(equalTo: powerstatsLabel.bottomAnchor, constant: 6),
            numberSmartLabel.leadingAnchor.constraint(equalTo: powerstatsLabel.leadingAnchor),
            numberSmartLabel.widthAnchor.constraint(equalToConstant: view.frame.width/10),
            numberSmartLabel.heightAnchor.constraint(equalToConstant: view.frame.width/10)
        ]
        let smartSliderConstraints = [
            smartSlider.topAnchor.constraint(equalTo: numberSmartLabel.topAnchor),
            smartSlider.leadingAnchor.constraint(equalTo: numberSmartLabel.trailingAnchor, constant: 4),
            smartSlider.widthAnchor.constraint(equalToConstant: view.frame.width/3.2),
            smartSlider.heightAnchor.constraint(equalToConstant: 5)
        ]
        let SmartLabelConstraints = [
            SmartLabel.topAnchor.constraint(equalTo: smartSlider.bottomAnchor, constant: 4),
            SmartLabel.leadingAnchor.constraint(equalTo: numberSmartLabel.trailingAnchor, constant: 6)
        ]
        let numberDurabilityLabelConstraints = [
            numberDurabilityLabel.topAnchor.constraint(equalTo: numberSmartLabel.bottomAnchor, constant: 8),
            numberDurabilityLabel.leadingAnchor.constraint(equalTo: numberSmartLabel.leadingAnchor),
            numberDurabilityLabel.widthAnchor.constraint(equalToConstant: view.frame.width/10),
            numberDurabilityLabel.heightAnchor.constraint(equalToConstant: view.frame.width/10)
        ]
        let durabilitySliderConstraints = [
            durabilitySlider.topAnchor.constraint(equalTo: numberDurabilityLabel.topAnchor),
            durabilitySlider.leadingAnchor.constraint(equalTo: numberDurabilityLabel.trailingAnchor, constant: 4),
            durabilitySlider.widthAnchor.constraint(equalToConstant: view.frame.width/3.2),
            durabilitySlider.heightAnchor.constraint(equalToConstant: 5)
        ]
        let durabilityLabelConstraints = [
            durabilityLabel.topAnchor.constraint(equalTo: durabilitySlider.bottomAnchor, constant: 4),
            durabilityLabel.leadingAnchor.constraint(equalTo: numberDurabilityLabel.trailingAnchor, constant: 6)
        ]
        let numberStrengthLabelConstraints = [
            numberStrengthLabel.topAnchor.constraint(equalTo: numberDurabilityLabel.bottomAnchor, constant: 8),
            numberStrengthLabel.leadingAnchor.constraint(equalTo: numberDurabilityLabel.leadingAnchor),
            numberStrengthLabel.widthAnchor.constraint(equalToConstant: view.frame.width/10),
            numberStrengthLabel.heightAnchor.constraint(equalToConstant: view.frame.width/10)
        ]
        let strengthSliderConstraints = [
            strengthSlider.topAnchor.constraint(equalTo: numberStrengthLabel.topAnchor),
            strengthSlider.leadingAnchor.constraint(equalTo: numberStrengthLabel.trailingAnchor, constant: 4),
            strengthSlider.widthAnchor.constraint(equalToConstant: view.frame.width/3.2),
            strengthSlider.heightAnchor.constraint(equalToConstant: 5)
        ]
        let strengthLabelConstraints = [
            strengthLabel.topAnchor.constraint(equalTo: strengthSlider.bottomAnchor, constant: 4),
            strengthLabel.leadingAnchor.constraint(equalTo: numberStrengthLabel.trailingAnchor, constant: 6)
        ]
        let numberSpeedLabelConstraints = [
            numberSpeedLabel.topAnchor.constraint(equalTo: powerstatsLabel.bottomAnchor, constant: 6),
            numberSpeedLabel.leadingAnchor.constraint(equalTo: smartSlider.trailingAnchor, constant: view.frame.width/25),
            numberSpeedLabel.widthAnchor.constraint(equalToConstant: view.frame.width/10),
            numberSpeedLabel.heightAnchor.constraint(equalToConstant: view.frame.width/10)
        ]
        let speedSliderConstraints = [
            speedSlider.topAnchor.constraint(equalTo: numberSpeedLabel.topAnchor),
            speedSlider.leadingAnchor.constraint(equalTo: numberSpeedLabel.trailingAnchor, constant: 4),
            speedSlider.widthAnchor.constraint(equalToConstant: view.frame.width/3.2),
            speedSlider.heightAnchor.constraint(equalToConstant: 5)
        ]
        let speedLabelConstraints = [
            speedLabel.topAnchor.constraint(equalTo: speedSlider.bottomAnchor, constant: 4),
            speedLabel.leadingAnchor.constraint(equalTo: numberSpeedLabel.trailingAnchor, constant: 6)
        ]
        let numberCombatLabelConstraints = [
            numberCombatLabel.topAnchor.constraint(equalTo: numberSpeedLabel.bottomAnchor, constant: 8),
            numberCombatLabel.leadingAnchor.constraint(equalTo: numberSpeedLabel.leadingAnchor),
            numberCombatLabel.widthAnchor.constraint(equalToConstant: view.frame.width/10),
            numberCombatLabel.heightAnchor.constraint(equalToConstant: view.frame.width/10)
        ]
        let combatSliderConstraints = [
            combatSlider.topAnchor.constraint(equalTo: numberCombatLabel.topAnchor),
            combatSlider.leadingAnchor.constraint(equalTo: numberCombatLabel.trailingAnchor, constant: 4),
            combatSlider.widthAnchor.constraint(equalToConstant: view.frame.width/3.2),
            combatSlider.heightAnchor.constraint(equalToConstant: 5)
        ]
        let combatLabelConstraints = [
            combatLabel.topAnchor.constraint(equalTo: combatSlider.bottomAnchor, constant: 4),
            combatLabel.leadingAnchor.constraint(equalTo: numberCombatLabel.trailingAnchor, constant: 6)
        ]
        let numberPowerLabelConstraints = [
            numberPowerLabel.topAnchor.constraint(equalTo: numberCombatLabel.bottomAnchor, constant: 8),
            numberPowerLabel.leadingAnchor.constraint(equalTo: numberCombatLabel.leadingAnchor),
            numberPowerLabel.widthAnchor.constraint(equalToConstant: view.frame.width/10),
            numberPowerLabel.heightAnchor.constraint(equalToConstant: view.frame.width/10)
        ]
        let powerSliderConstraints = [
            powerSlider.topAnchor.constraint(equalTo: numberPowerLabel.topAnchor),
            powerSlider.leadingAnchor.constraint(equalTo: numberPowerLabel.trailingAnchor, constant: 4),
            powerSlider.widthAnchor.constraint(equalToConstant: view.frame.width/3.2),
            powerSlider.heightAnchor.constraint(equalToConstant: 5)
        ]
        let powerLabelConstraints = [
            powerLabel.topAnchor.constraint(equalTo: powerSlider.bottomAnchor, constant: 4),
            powerLabel.leadingAnchor.constraint(equalTo: numberPowerLabel.trailingAnchor, constant: 6)
        ]
        let publisherLabelConstraints = [
            publisherLabel.topAnchor.constraint(equalTo: numberStrengthLabel.bottomAnchor, constant: view.frame.width/20),
            publisherLabel.leadingAnchor.constraint(equalTo: characterImageView.leadingAnchor)
        ]
        let toPublisherLabelConstraints = [
            toPublisherLabel.topAnchor.constraint(equalTo: publisherLabel.bottomAnchor, constant: 2),
            toPublisherLabel.leadingAnchor.constraint(equalTo: characterImageView.leadingAnchor, constant: view.frame.width/20)
        ]
        let raceLabelConstraints = [
            raceLabel.topAnchor.constraint(equalTo: numberStrengthLabel.bottomAnchor, constant: view.frame.width/20),
            raceLabel.leadingAnchor.constraint(equalTo: publisherLabel.trailingAnchor, constant: view.frame.width/3.5)
        ]
        
        NSLayoutConstraint.activate(characterImageViewConstraints)
        NSLayoutConstraint.activate(fullNameLabelConstraints)
        NSLayoutConstraint.activate(toFullNameLabelConstraints)
        NSLayoutConstraint.activate(characterLabelConstraints)
        NSLayoutConstraint.activate(toCharacterNameLabelConstraints)
        NSLayoutConstraint.activate(powerstatsLabelConstraints)
        
        NSLayoutConstraint.activate(numberSmartLabelConstraints)
        NSLayoutConstraint.activate(smartSliderConstraints)
        NSLayoutConstraint.activate(SmartLabelConstraints)
        
        NSLayoutConstraint.activate(numberDurabilityLabelConstraints)
        NSLayoutConstraint.activate(durabilitySliderConstraints)
        NSLayoutConstraint.activate(durabilityLabelConstraints)
        
        NSLayoutConstraint.activate(numberStrengthLabelConstraints)
        NSLayoutConstraint.activate(strengthSliderConstraints)
        NSLayoutConstraint.activate(strengthLabelConstraints)
        
        NSLayoutConstraint.activate(numberSpeedLabelConstraints)
        NSLayoutConstraint.activate(speedSliderConstraints)
        NSLayoutConstraint.activate(speedLabelConstraints)
        
        NSLayoutConstraint.activate(numberCombatLabelConstraints)
        NSLayoutConstraint.activate(combatSliderConstraints)
        NSLayoutConstraint.activate(combatLabelConstraints)
        
        NSLayoutConstraint.activate(numberPowerLabelConstraints)
        NSLayoutConstraint.activate(powerSliderConstraints)
        NSLayoutConstraint.activate(powerLabelConstraints)
        
        NSLayoutConstraint.activate(publisherLabelConstraints)
        NSLayoutConstraint.activate(toPublisherLabelConstraints)
        NSLayoutConstraint.activate(raceLabelConstraints)
        
        return scrollView
    }()
    lazy var favoriteButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.tintColor = .white
        button.setTitle(" Add to Favorites", for: .normal)
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
