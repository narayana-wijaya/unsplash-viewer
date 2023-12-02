//
//  ListPresenterStubs.swift
//  iSPLASHTests
//
//  Created by Narayana Wijaya on 13/02/23.
//

import Foundation
@testable import iSPLASH

class ListInteractorStub: Interactor {
  var presenter: Presenter?
  
  func getData(page: Int, query: String) {
    let splashImages = [
      SplashImage(id: "1", urls: ImageURLS(regular: "", small: ""), width: 400, height: 200),
      SplashImage(id: "2", urls: ImageURLS(regular: "", small: ""), width: 300, height: 200)
    ]
    let responseModel = ResponseModel(total: 4, total_pages: 2, results: splashImages)
    
    self.presenter?.interactorDidFetchData(with: .success(responseModel))
  }
}

class ListViewControllerStub: View, ListViewInterface {
  var presenter: PresenterViewInterface?
  var data = [SplashImage]()
  
  func update(with data: [SplashImage]) {
    self.data.append(contentsOf: data)
  }
  
  func update(with error: String) {}
  
  func removeAllData() {
    data.removeAll()
  }
}
