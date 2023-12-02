//
//  RouterTests.swift
//  iSPLASHTests
//
//  Created by Narayana Wijaya on 13/02/23.
//

import XCTest
@testable import iSPLASH

class RouterTest: XCTestCase {
  var sut: Router!
  var listView: ImageListViewController!
  
  override func setUp() {
    sut = ListRouter()
    listView = ImageListViewController()
    sut.view = listView
  }
  
  func test_startApp_viewControllerIsImageList() {
    XCTAssertTrue(sut.view is ImageListViewController)
  }
  
  func test_showfullImage() {
    let origin = UINavigationControllerMock(rootViewController: listView)

    sut.presentImageDetailView(imageUrl: "https://images.unsplash.com/reserve/HgZuGu3gSD6db21T3lxm_San%2520Zenone.jpg", from: listView)

    XCTAssertTrue(origin.pushViewControllerCalled)
  }
  
  class UINavigationControllerMock: UINavigationController {
    var pushViewControllerCalled = false
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
      super.pushViewController(viewController, animated: animated)
      pushViewControllerCalled = true
    }
  }
}


