//
//  AppDependencies.swift
//  iSPLASH
//
//  Created by Narayana Wijaya on 12/02/23.
//

import Foundation
import UIKit

class AppDependencies {
  var router: Router = ListRouter()
  
  init() {
    configureDependencies()
  }
  
  func startApp(window: UIWindow) {
    router.presentListInterface(window)
  }
  
  func configureDependencies() {
    let listPresenter = ListPresenter()
    let dataService = NetworkService()
    let listInteractor = ListInteractor(dataService: dataService)
    
    listInteractor.presenter = listPresenter
    
    listPresenter.interactor = listInteractor
    listPresenter.router = router
    
    let listViewController = ImageListViewController()
    listViewController.presenter = listPresenter
    listPresenter.view = listViewController
    
    router.view = listViewController
  }
}
