//  Created by Muhammad Hussaan Saeed on 10/31/21.

import UIKit

protocol ProductsRouting {
    
    
}

class ProductsRouter {
    
    static func assembleProductsModule() -> UIViewController {
        
        let interactor: ProductsInteracting = ProductsInteractor()
        
        let router: ProductsRouting = ProductsRouter()
                
        var presenter: ProductsPresenting = ProductsPresenter(interactor: interactor,
                                                              router: router)
        
        let view: ProductsViewing = ProductsViewController(presenter: presenter)
        
        view.listViewController = ProductListingRouter.assembleProductListingModule()
        
        presenter.view = view
        
        return view
        
    }
}

extension ProductsRouter: ProductsRouting {
    
}
