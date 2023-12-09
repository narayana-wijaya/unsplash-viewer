//
//  FullImageViewController.swift
//  iSPLASH
//
//  Created by Narayana Wijaya on 14/02/23.
//

import UIKit

class FullImageViewController: UIViewController {
  private lazy var imageView: UIImageView = {
    let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
    imageView.contentMode = .scaleAspectFit
    return imageView
  }()
  
  private var imageUrl: String?
  
  init(imageUrl: String) {
    super.init(nibName: nil, bundle: nil)
    self.imageUrl = imageUrl
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func loadView() {
    super.loadView()
    view.addSubview(imageView)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .black
    imageView.sd_setImage(with: URL(string: imageUrl ?? ""), placeholderImage:  UIImage(systemName: "photo"))
  }
}
