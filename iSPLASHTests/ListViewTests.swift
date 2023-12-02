//
//  iSPLASHTests.swift
//  iSPLASHTests
//
//  Created by Narayana Wijaya on 12/02/23.
//

import XCTest
@testable import iSPLASH

final class ListViewTests: XCTestCase {
  var sut: ImageListViewController!
  var presenter: Presenter?

  override func setUp() {
    sut = ImageListViewController()
    sut.loadViewIfNeeded()
  }

  func test_subview_containCollectionView() {
    XCTAssertTrue(sut.view.subviews.contains(where: { view in
      view is UICollectionView
    }))
  }
  
  func test_navbar_containSearchController() {
    XCTAssertNotNil(sut.navigationItem.searchController)
  }
}
