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
        if !data.isEmpty {
            cell.setup(imageUrl: data[indexPath.row].urls.small)
        }
        
        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        if kind == UICollectionView.elementKindSectionHeader {
//            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderView", for: indexPath) as! HeaderView
//            headerView.setup(title: searchText ?? "Nature" + " Pictures", desc: "\(totalImage ?? 0) images")
//            
//            return headerView
//        } else {
//            fatalError("Reusable view not implement")
//        }
//    }
}

extension ImageListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let image = data[indexPath.row]
        presenter?.openFullImage(image: image, from: self)
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
        guard let text = searchController.searchBar.text, !text.isEmpty else {
            presenter?.requestData()
            return }
        self.searchText = text
        presenter?.searchImage(text: text)
    }
}
