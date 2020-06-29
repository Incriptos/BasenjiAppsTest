//
//  DetailsController.swift
//  BasenjiAppsTest
//
//  Created by Andrew Vashulenko on 27.06.2020.
//  Copyright © 2020 AVTeam. All rights reserved.
//

import UIKit


class DetailsController: UIViewController {
  
  //MARK: - UI
  
  private let avatarImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.image = UIImage(named: "userAvatar")
    return imageView
  }()
  
  private let fullRepoNameLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = .systemFont(ofSize: 16, weight: .bold)
    label.textColor = .black
    label.numberOfLines = 0
    label.textAlignment = .center
    return label
  }()
  
  private let repoURLLinkLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = .systemFont(ofSize: 14, weight: .regular)
    label.textColor = .blue
    label.numberOfLines = 0
    return label
  }()
  
  private let repoDiscriptoinLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = .systemFont(ofSize: 14, weight: .regular)
    label.textColor = .black
    label.numberOfLines = 0
    return label
  }()
  
  private let repoLaguage: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = .systemFont(ofSize: 14, weight: .regular)
    label.textColor = .gray
    label.textAlignment = .left
    return label
  }()
  
  private let lastDateUpdate: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = .systemFont(ofSize: 14, weight: .regular)
    label.textColor = .gray
    label.textAlignment = .left
    return label
  }()
  
  var item: Repositories?
  private let date = Date()
  
  //MARK: - Setup View
  
  private func setupView() {
    
    view.backgroundColor = .white
    view.addSubview(avatarImageView)
    view.addSubview(repoLaguage)
    view.addSubview(lastDateUpdate)
    view.addSubview(fullRepoNameLabel)
    view.addSubview(repoDiscriptoinLabel)
    view.addSubview(repoURLLinkLabel)
  }
  
  //MARK: - Setup Constraints
  
  private func setupConstraints() {
    
    avatarImageView.heightAnchor.constraint(equalToConstant: 88).isActive = true
    avatarImageView.widthAnchor.constraint(equalToConstant: 88).isActive = true
    avatarImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    avatarImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 48).isActive = true
    
    repoLaguage.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 48).isActive = true
    repoLaguage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
    
    lastDateUpdate.centerYAnchor.constraint(equalTo: repoLaguage.centerYAnchor).isActive = true
    lastDateUpdate.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
    
    fullRepoNameLabel.topAnchor.constraint(equalTo: repoLaguage.bottomAnchor, constant: 24).isActive = true
    fullRepoNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    fullRepoNameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
    fullRepoNameLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
    
    repoDiscriptoinLabel.topAnchor.constraint(equalTo: fullRepoNameLabel.bottomAnchor, constant: 24).isActive = true
    repoDiscriptoinLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    repoDiscriptoinLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
    repoDiscriptoinLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
    
    repoURLLinkLabel.topAnchor.constraint(equalTo: repoDiscriptoinLabel.bottomAnchor, constant: 24).isActive = true
    repoURLLinkLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
    repoURLLinkLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
  }
  
  //MARK: - Life cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupView()
    setupConstraints()
    setupController()
  }
  
  private func setupController() {
    
    guard let itemObject = item else { return }
    if let avatarURL = item?.avatar {
      avatarImageView.downloaded(from: avatarURL)
    }
    
    repoLaguage.text = itemObject.languege
    lastDateUpdate.text = "Last update:" + date.string(format: itemObject.updateAt)
    fullRepoNameLabel.text = itemObject.fullName
    repoDiscriptoinLabel.text = itemObject.descript
    repoURLLinkLabel.text = itemObject.url
  }
}
