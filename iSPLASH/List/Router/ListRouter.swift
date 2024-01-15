//
//  ListRouter.swift
//  iSPLASH
//
//  Created by Narayana Wijaya on 12/02/23.
//

import Foundation
import UIKit

class ListRouter: Router {
  var view: View?
  
  func presentListInterface(_ window: UIWindow) {
    guard let listView = view as? ImageListViewController else { return }
    let nav = UINavigationController(rootViewController: listView)
    window.rootViewController = nav
  }
  
  func presentImageDetailView(image: SplashImage, from view: UIViewController) {
      guard let nav = view.navigationController, let url = URL(string: image.urls.small), UIApplication.shared.canOpenURL(url) else { return }
    
    let imageViewer = FullImageViewController(image: image)
    nav.pushViewController(imageViewer, animated: true)
  }
}

