//
//  ListController.swift
//  BasenjiAppsTest
//
//  Created by Andrew Vashulenko on 27.06.2020.
//  Copyright © 2020 AVTeam. All rights reserved.
//

import UIKit

class ListController: UIViewController {

  //MARK: - UI
  
  private lazy var listCollectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
    
    collectionView.register(ListCollectionViewCell.self,
                            forCellWithReuseIdentifier: ListCollectionViewCell.cellId)
    
    collectionView.delegate = self
    collectionView.dataSource = self
    
    return collectionView
  }()
  
  private let searchTextField: UITextField = {
    let textField = UITextField()
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.borderStyle = .none
    textField.placeholder = "Введите текст"
    return textField
  }()
  
  private let searchButton: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.backgroundColor = .blue
    button.layer.cornerRadius = 10
    button.setTitle("Поиск", for: .normal)
    button.setTitleColor(.white, for: .normal)
    button.addTarget(self, action: #selector(searchButtonTapped(_:)), for: .touchUpInside)
    return button
  }()
  
  private let activity: UIActivityIndicatorView = {
    let activity = UIActivityIndicatorView()
    activity.translatesAutoresizingMaskIntoConstraints = false
    activity.color = .black
    activity.startAnimating()
    activity.isHidden = true
    return activity
  }()
  
  //MARK: - Presenter
  
   lazy var presenter: ListPresenter = {
     let presenter = ListPresenter()
     presenter.delegate = self
     return presenter
   }()
    
  //MARK: - Setup View
  
  private func setupViews() {
    
    view.backgroundColor = .white
    view.addSubview(searchTextField)
    view.addSubview(searchButton)
    view.addSubview(listCollectionView)
    listCollectionView.addSubview(activity)
  }
  
  //MARK: - Setup Constraints
   
  private func setupConstraints() {
    
    searchTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true
    searchTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
    searchTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
    searchTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -100).isActive = true
    
    searchButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    searchButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
    searchButton.centerYAnchor.constraint(equalTo: searchTextField.centerYAnchor).isActive = true
    searchButton.leadingAnchor.constraint(equalTo: searchTextField.trailingAnchor, constant: 16).isActive = true
    
    listCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 44).isActive = true
    listCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
    listCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    listCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    
    activity.heightAnchor.constraint(equalToConstant: 88).isActive = true
    activity.widthAnchor.constraint(equalToConstant: 88).isActive = true
    activity.centerYAnchor.constraint(equalTo: listCollectionView.centerYAnchor).isActive = true
    activity.centerXAnchor.constraint(equalTo: listCollectionView.centerXAnchor).isActive = true
  }
  
  private func setupNavigationBar() {
    
    navigationItem.title = "Search"
  }
  
  //MARK: - Life cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupViews()
    setupConstraints()
    setupNavigationBar()
    
  }
  
  
  @objc
  private func searchButtonTapped(_ sender: UIButton) {
    activity.isHidden = false
    guard let searchString = searchTextField.text else { return }
    presenter.getSearchByName(repoName: searchString)
  }
  
}

extension ListController: ListPresenterDelegate {
  
  func updateUI() {
    
    DispatchQueue.main.async {
      self.activity.isHidden = true
      self.listCollectionView.reloadData()
    }
    
  }
  
  func showError() {
    
    DispatchQueue.main.async {
      self.activity.isHidden = true
      let alertController = UIAlertController(title: "Ошибка", message: "Что-то пошло не так", preferredStyle: .alert)
      let okButton = UIAlertAction(title: "ОК", style: .cancel) { action in }
      alertController.addAction(okButton)
      self.present(alertController, animated: true, completion: nil)
    }
  }
  
}
