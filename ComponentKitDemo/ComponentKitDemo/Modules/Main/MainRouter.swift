//  Created by Muhammad Hussaan Saeed on 11/8/21.

import Foundation
import UIKit

protocol MainRouting {
    
    func pushProductsModule(in navigationController: UINavigationController?)
    
}

class MainRouter {
    
    static func assembleMainModule() -> UIViewController {
        
        let interactor: MainInteracting = MainInteractor()
        
        let router: MainRouting = MainRouter()
        
        var presenter: MainPresenting = MainPresenter(interactor: interactor,
                                                      router: router)
        
        let view: MainViewing = MainViewController(presenter: presenter)
        
        presenter.view = view
    
        return view
    }
}

extension MainRouter: MainRouting {
    
    func pushProductsModule(in navigationController: UINavigationController?) {
        
        let viewController = ProductsRouter.assembleProductsModule()
        navigationController?.pushViewController(viewController, animated: true)
        
    }
}
