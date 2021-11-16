//  Created by Muhammad Hussaan Saeed on 11/8/21.

import UIKit

protocol ProductListingRouting {
    
}

class ProductListingRouter {
    
    static func assembleProductListingModule() -> UIViewController {
        
        let interactor: ProductListingInteracting = ProductListingInteractor(service: ProductsService())
        
        let router: ProductListingRouting = ProductListingRouter()
        
        var presenter: ProductListingPresenting = ProductListingPresenter(interactor: interactor,
                                                                          router: router)
        
        let view: ProductListingViewing = ProductListingViewController(presenter: presenter)
        
        presenter.view = view
        
        return view
    }
    
}

extension ProductListingRouter: ProductListingRouting { }
