//
//  ViperProtocol.swift
//  iSPLASH
//
//  Created by Narayana Wijaya on 12/02/23.
//

import Foundation
import UIKit

protocol View {
    var presenter: PresenterViewInterface? { get set }
}

protocol Interactor {
    var presenter: Presenter? { get set }
    
    func getData(page: Int, query: String)
}

protocol Presenter {
    var router: Router? { get set }
    var interactor: Interactor? { get set }
    var view: ListViewInterface? { get set }
    
    func interactorDidFetchData(with result: Result<ResponseModel, Error>)
}

protocol Router {
    var view: View? { get set }
    
    func presentListInterface(_ window: UIWindow)
    func presentImageDetailView(image: SplashImage, from view: UIViewController)
}

protocol PresenterViewInterface {
    func requestData()
    func loadMore()
    func searchImage(text: String)
    func openFullImage(image: SplashImage, from: UIViewController)
}

protocol ListViewInterface {
    func update(with data: ResponseModel)
    func update(with error: String)
    func removeAllData()
}
