//
//  ListInteractor.swift
//  iSPLASH
//
//  Created by Narayana Wijaya on 12/02/23.
//

import Foundation

class ListInteractor: Interactor {
  var presenter: Presenter?
  var dataService: DataService
  
  init(dataService: DataService) {
    self.dataService = dataService
  }
  
  func getData(page: Int, query: String) {
    dataService.request(url: "https://api.unsplash.com/search/photos?page=\(page)&query=\(query)") { [weak self] result in
      self?.presenter?.interactorDidFetchData(with: result)
    }
  }
}
