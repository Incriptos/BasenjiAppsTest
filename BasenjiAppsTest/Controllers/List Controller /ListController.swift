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
  
  private let searchController = UISearchController(searchResultsController: nil)
  
  private lazy var listCollectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    
    collectionView.register(ListCollectionViewCell.self,
                            forCellWithReuseIdentifier: ListCollectionViewCell.cellId)
    
    collectionView.delegate = self
    collectionView.dataSource = self
    
    return collectionView
  }()
  
  //MARK: - Presenter
   lazy var presenter: ListPresenter = {
     let presenter = ListPresenter()
     presenter.delegate = self
     return presenter
   }()
  
  //MARK: - Vars & Lets
  
  private var timer = Timer()
  
  //MARK: - Setup View
  
  private func setupViews() {
    
    view.addSubview(listCollectionView)
  }
  
  //MARK: - Setup Constraints
   
  private func setupConstraints() {
    
    listCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
    listCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
    listCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    listCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
  }
  
  private func setupNavigationBar() {
    
    navigationItem.title = "User search"
  }
  
  private func setupSearchBar() {
    
    navigationItem.searchController = searchController
    navigationItem.hidesSearchBarWhenScrolling = false
    searchController.searchBar.delegate = self
  }
  
  //MARK: - Life cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupViews()
    setupConstraints()
    setupNavigationBar()
    setupSearchBar()
  
    view.backgroundColor = .white
  }
}

extension ListController: UISearchBarDelegate {
  
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    
    timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { [weak self] _ in
      self?.presenter.getSearchByName(repoName: searchText)
    })
    
  }
}

extension ListController: ListPresenterDelegate {
  
  func updateUI() {
    
    DispatchQueue.main.async {
      self.listCollectionView.reloadData()
    }
    
  }
  
  func showError() {
    
  }
  
}
