//
//  SceneDelegate.swift
//  iSPLASH
//
//  Created by Narayana Wijaya on 12/02/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?
  
  let appDependencies = AppDependencies()

  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    
    guard let windowScene = (scene as? UIWindowScene) else { return }
    
    let window = UIWindow(windowScene: windowScene)
    appDependencies.startApp(window: window)
    self.window = window
    window.makeKeyAndVisible()
  }
}

