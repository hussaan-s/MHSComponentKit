//  Created by Muhammad Hussaan Saeed on 11/8/21.

import Foundation

protocol MainPresenting {
    
    var view: MainViewing? { get set }
    
    func onTapProduct()
}

class MainPresenter {
    
    weak var view: MainViewing?
    var interactor: MainInteracting
    var router: MainRouting
    
    init(interactor: MainInteracting,
         router: MainRouting) {

        self.interactor = interactor
        self.router = router
    }
    
}

extension MainPresenter: MainPresenting {
    
    func onTapProduct() {
        router.pushProductsModule(in: view?.navigationController)
    }
}

