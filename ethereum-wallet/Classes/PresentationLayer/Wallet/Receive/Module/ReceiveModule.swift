// Copyright © 2018 Conicoin LLC. All rights reserved.
// Created by Artur Guseinov


import UIKit


class ReceiveModule {
    
  class func create(app: Application) -> ReceiveModuleInput {
    let router = ReceiveRouter()
    let presenter = ReceivePresenter()
    let interactor = ReceiveInteractor()
    let viewController = R.storyboard.receive.receiveViewController()!

    interactor.output = presenter

    viewController.output = presenter

    presenter.view = viewController
    presenter.router = router
    presenter.interactor = interactor
    router.app = app
  
    // Injections
    interactor.qrService = QRService()
    interactor.walletRepsitory = app.walletRepository
        
    return presenter
  }
    
}
