//
//  ListCollectionView.swift
//  BasenjiAppsTest
//
//  Created by Andrew Vashulenko on 27.06.2020.
//  Copyright © 2020 AVTeam. All rights reserved.
//

import Foundation
import UIKit

extension ListController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
  
  //MARK: - numberOfItemsInSection
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return presenter.sortedRepos.count

  }
  
  //MARK: - cellForItemAt
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListCollectionViewCell.cellId, for: indexPath) as! ListCollectionViewCell
    
    let item = presenter.sortedRepos[indexPath.row]
    
    return cell.configureCell(name: item.name, starCount: item.starzCount, avatarURL: item.avatar)
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
    let item = presenter.sortedRepos[indexPath.row]
    
    let controller: DetailsController = DetailsController()
    controller.item = item
    navigationController?.pushViewController(controller, animated: true)
  }
  
  //MARK: - sizeForItemAt
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
    let width: CGFloat = view.frame.width - 16
    let height: CGFloat = 80
    
    return CGSize(width: width, height: height)
  }
  
  //MARK: - insetForSectionAt
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
  }
  
  //MARK: - minimumLineSpacingForSectionAt
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 8
  }
}
