//
//  ListPresenter.swift
//  iSPLASH
//
//  Created by Narayana Wijaya on 12/02/23.
//

import UIKit

class ListPresenter: Presenter, PresenterViewInterface {
  var router: Router?
  var interactor: Interactor? {
    didSet {
      page = 1
    }
  }
  var view: ListViewInterface?
  
  private var totalPage: Int = 10
  private var page: Int = 1
  private var search: String = "nature"
  
  func requestData() {
    interactor?.getData(page: page, query: search)
  }
  
  func interactorDidFetchData(with result: Result<ResponseModel, Error>) {
    switch result {
    case .success(let data):
      self.totalPage = data.total_pages
      view?.update(with: data.results)
    case .failure(let error):
      view?.update(with: error.localizedDescription)
    }
  }
  
  func loadMore() {
    guard page < totalPage else { return }
    page += 1
    requestData()
  }
  
  func searchImage(text: String) {
    search = text
    totalPage = 10
    page = 1
    view?.removeAllData()
    requestData()
  }
  
  func openFullImage(url: String, from view: UIViewController) {
    router?.presentImageDetailView(imageUrl: url, from: view)
  }
}
