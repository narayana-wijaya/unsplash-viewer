//
//  ListViewController.swift
//  iSPLASH
//
//  Created by Narayana Wijaya on 12/02/23.
//

import UIKit

class ImageListViewController: UIViewController, ListViewInterface, View {
  var presenter: PresenterViewInterface?
  var data = [SplashImage]()
  
  private lazy var searchController: UISearchController = {
    let searchController = UISearchController()
    searchController.delegate = self
    searchController.searchResultsUpdater = self
    searchController.searchBar.placeholder = "Search image"
    return searchController
  }()
  
  private lazy var collectionView: UICollectionView = {
    let layout = CustomLayout()
    let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collection.dataSource = self
    collection.delegate = self
    collection.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: "imageListCell")
    collection.translatesAutoresizingMaskIntoConstraints = false
    collection.isHidden = true
    return collection
  }()
  
  private let emptyLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.numberOfLines = 0
    label.lineBreakMode = .byWordWrapping
    label.textAlignment = .center
    return label
  }()
  
  override func loadView() {
    super.loadView()
    setupView()
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    title = "iSplash"
    if let layout = collectionView.collectionViewLayout as? CustomLayout {
      layout.delegate = self
    }
    self.navigationItem.searchController = searchController
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    presenter?.requestData()
  }
  
  func setupView() {
    view.backgroundColor = .systemBackground
    view.addSubview(emptyLabel)
    view.addSubview(collectionView)
    NSLayoutConstraint.activate([
      collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
      collectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
      
      emptyLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
      emptyLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      emptyLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
    ])
    setupSearchView()
  }
  
  func setupSearchView() {
    searchController.searchBar.barStyle = .black
    searchController.searchBar.tintColor = .white
    
    let textField = searchController.searchBar.searchTextField
    
    textField.defaultTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    
    let glassIcon = textField.leftView as! UIImageView
    glassIcon.image = glassIcon.image?.withRenderingMode(.alwaysTemplate)
    glassIcon.tintColor = .white
    
    let clearButton = textField.value(forKey: "clearButton") as! UIButton
    clearButton.setImage(clearButton.imageView?.image?.withRenderingMode(.alwaysTemplate), for: .normal)
    clearButton.tintColor = .white
  }
  
  func update(with data: [SplashImage]) {
    DispatchQueue.main.async {
      self.data.append(contentsOf: data)
      if !self.data.isEmpty {
        self.setErrorLabel(hidden: true)
        self.collectionView.reloadData()
      } else {
        self.emptyLabel.text = "No image found"
        self.setErrorLabel(hidden: false)
      }
    }
  }

  func update(with error: String) {
    DispatchQueue.main.async {
      self.emptyLabel.text = error
      self.setErrorLabel(hidden: false)
    }
  }
  
  func removeAllData() {
    data.removeAll()
  }
  
  private func setErrorLabel(hidden: Bool) {
    self.emptyLabel.isHidden = hidden
    self.collectionView.isHidden = !hidden
  }
}
