//
//  FullImageViewController.swift
//  iSPLASH
//
//  Created by Narayana Wijaya on 14/02/23.
//

import UIKit

class FullImageViewController: UIViewController {
    private let userImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 32, height: 23))
        imageView.layer.cornerRadius = 16
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .left
        return label
    }()
    
    private let captionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .left
        return label
    }()
    
    private var image: SplashImage?
    
    init(image: SplashImage) {
        super.init(nibName: nil, bundle: nil)
        self.image = image
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view.addSubview(userImageView)
        view.addSubview(userNameLabel)
        view.addSubview(imageView)
        view.addSubview(captionLabel)
        
        NSLayoutConstraint.activate([
            userImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            userImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            userNameLabel.leftAnchor.constraint(equalTo: userImageView.rightAnchor, constant: 16),
            userNameLabel.centerYAnchor.constraint(equalTo: userImageView.centerYAnchor),
            imageView.topAnchor.constraint(equalTo: userImageView.bottomAnchor, constant: 16),
            imageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            captionLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
            captionLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            captionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setData()
    }
    
    private func setData() {
        guard let image = image else { return }
        
        imageView.sd_setImage(with: URL(string: image.urls.small), placeholderImage:  UIImage(systemName: "photo"))
        captionLabel.text = image.description ?? image.alt_description ?? ""
        
        if let user = image.user {
            userImageView.sd_setImage(with: URL(string: user.profile_image?.small ?? ""))
            userNameLabel.text = user.name
        }
    }
}
