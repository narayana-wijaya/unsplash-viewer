//
//  ImageCollectionCell.swift
//  iSPLASH
//
//  Created by Narayana Wijaya on 12/02/23.
//

import UIKit
import SDWebImage

class ImageCollectionViewCell: UICollectionViewCell {
  private lazy var imageView: UIImageView = {
    let iV = UIImageView()
    iV.contentMode = .scaleAspectFit
    iV.translatesAutoresizingMaskIntoConstraints = false
    return iV
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    addSubview(imageView)
    setupConstraint()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupConstraint() {
    NSLayoutConstraint.activate([
      imageView.topAnchor.constraint(equalTo: topAnchor),
      imageView.leftAnchor.constraint(equalTo: leftAnchor),
      imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
      imageView.centerYAnchor.constraint(equalTo: centerYAnchor)
    ])
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    imageView.image = nil
  }
  
  func setup(imageUrl: String) {
    guard let url = URL(string: imageUrl) else {
      return
    }
    imageView.sd_setImage(with: url, placeholderImage: UIImage(systemName: "photo"))
  }
}

