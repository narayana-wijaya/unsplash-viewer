//
//  FullImageViewTests.swift
//  iSPLASHTests
//
//  Created by Narayana Wijaya on 14/02/23.
//

import Foundation
import XCTest
@testable import iSPLASH

class FullImageViewTest: XCTestCase {
  var sut: FullImageViewController!
  
  override func setUp() {
    sut = FullImageViewController(imageUrl: "")
    sut.loadViewIfNeeded()
  }
  
  func test_subview_containImageView() {
    XCTAssertTrue(sut.view.subviews.contains(where: { view in
      view is UIImageView
    }))
  }
}
