//
//  ListViewController+Extension.swift
//  iSPLASH
//
//  Created by Narayana Wijaya on 14/02/23.
//

import UIKit

extension ImageListViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return data.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageListCell", for: indexPath) as? ImageCollectionViewCell else {
      fatalError("Cell not found")
    }
    cell.setup(imageUrl: data[indexPath.row].urls.small)
    return cell
  }
}

extension ImageListViewController: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let imageUrl = data[indexPath.row].urls.regular
    presenter?.openFullImage(url: imageUrl, from: self)
  }
  
  func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
    if !data.isEmpty && indexPath.row == data.count - 1 {
      presenter?.loadMore()
    }
  }
}

extension ImageListViewController: CustomLayoutDelegate {
  func collectionView(_ collectionView: UICollectionView, aspectRatioForImageAt indexPath: IndexPath) -> CGFloat {
      guard !data.isEmpty else { return 0 }
    let image = data[indexPath.row]
    return image.height/image.width
  }
}

extension ImageListViewController: UISearchResultsUpdating, UISearchControllerDelegate {
  func updateSearchResults(for searchController: UISearchController) {
    guard let text = searchController.searchBar.text, !text.isEmpty else { return }
    presenter?.searchImage(text: text)
  }
}
