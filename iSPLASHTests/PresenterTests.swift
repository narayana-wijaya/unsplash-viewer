//
//  PresenterTests.swift
//  iSPLASHTests
//
//  Created by Narayana Wijaya on 13/02/23.
//

import Foundation
import XCTest
@testable import iSPLASH

class PresenterTest: XCTestCase {
  var sut: ListPresenter!
  var view: ListViewControllerStub!
  var interactor: ListInteractorStub!
  
  override func setUp() {
    sut = ListPresenter()
    
    view = ListViewControllerStub()
    sut.view = view
    view.presenter = sut
    
    interactor = ListInteractorStub()
    interactor.presenter = sut
    sut.interactor = interactor
  }
  
  func test_getDataSuccess_dataIsNotEmpty() {
    sut.requestData()
    XCTAssertFalse(view.data.isEmpty)
  }
  
  func test_loadMoreData_newDataAppend() {
    sut.requestData()
    XCTAssertEqual(view.data.count, 2)
    
    sut.loadMore()
    XCTAssertEqual(view.data.count, 4)
  }
  
  func test_loadMoreData_shouldNotExceedPageCount() {
    sut.requestData()
    XCTAssertEqual(view.data.count, 2)
    
    sut.loadMore()
    XCTAssertEqual(view.data.count, 4)
    
    sut.loadMore()
    XCTAssertEqual(view.data.count, 4)
  }
  
  func test_newSearch_OldDataIsRemove() {
    sut.requestData()
    XCTAssertEqual(view.data.count, 2)
    
    sut.loadMore()
    XCTAssertEqual(view.data.count, 4)
    
    sut.searchImage(text: "")
    XCTAssertEqual(view.data.count, 2)
  }
}
