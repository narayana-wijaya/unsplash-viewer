//
//  AppDelegate.swift
//  iSPLASH
//
//  Created by Narayana Wijaya on 12/02/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    let appearance = UINavigationBarAppearance()
    appearance.configureWithOpaqueBackground()
    appearance.backgroundColor = .purple
    appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    UINavigationBar.appearance().standardAppearance = appearance
    UINavigationBar.appearance().scrollEdgeAppearance = appearance
    UINavigationBar.appearance().tintColor = .white
    
    return true
  }
  
}

