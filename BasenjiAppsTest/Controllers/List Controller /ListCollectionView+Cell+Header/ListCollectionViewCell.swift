//
//  ListCollectionViewCell.swift
//  BasenjiAppsTest
//
//  Created by Andrew Vashulenko on 27.06.2020.
//  Copyright © 2020 AVTeam. All rights reserved.
//

import UIKit
import Kingfisher


class ListCollectionViewCell: UICollectionViewCell {
  
  //MARK: - Cell Id
  
  static let cellId = "ListCollectionViewCell"
  
  //MARK: - UI
  
  private let avatarImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  private let nameLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = .systemFont(ofSize: 14, weight: .bold)
    label.textColor = .black
    label.numberOfLines = 0
    label.text = "Repo name hihihi"
    return label
  }()
  
  private let starImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    if let image = UIImage(named: "StarIconImage") {
      imageView.image = image
    }
    return imageView
  }()
  
  private let repoStarsLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = .systemFont(ofSize: 12, weight: .bold)
    label.textColor = .black
    label.text = "1488"
    return label
  }()
  
  //MARK: - Setup Views
  
  private func setupView() {
    addSubview(avatarImageView)
    addSubview(nameLabel)
    addSubview(starImageView)
    addSubview(repoStarsLabel)
  }
  
  //MARK: - Setup Constraints
  
  private func setupConstraints() {
    
    avatarImageView.heightAnchor.constraint(equalToConstant: 44).isActive = true
    avatarImageView.widthAnchor.constraint(equalToConstant: 44).isActive = true
    avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
    avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
    
    nameLabel.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor, constant: -12).isActive = true
    nameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16).isActive = true
    
    starImageView.heightAnchor.constraint(equalToConstant: 16).isActive = true
    starImageView.widthAnchor.constraint(equalToConstant: 16).isActive = true
    starImageView.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor, constant: 16).isActive = true
    starImageView.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16).isActive = true
    
    repoStarsLabel.centerYAnchor.constraint(equalTo: starImageView.centerYAnchor).isActive = true
    repoStarsLabel.leadingAnchor.constraint(equalTo: starImageView.trailingAnchor, constant: 8).isActive = true
  }
  
  func configureCell(name: String, starCount: Int, avatarURL: String?) -> UICollectionViewCell {
    
    nameLabel.text = "Name: \(name)"
    repoStarsLabel.text = "\(starCount)"
    
    if let url = avatarURL {
      avatarImageView.downloaded(from: url)
    }
        
    return self
  }
  
  
  //MARK: - Init
  
  override init(frame: CGRect) {
    super.init(frame: frame)
  
    backgroundColor = .white
    layer.cornerRadius = 10
    
    setupView()
    setupConstraints()
    
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
