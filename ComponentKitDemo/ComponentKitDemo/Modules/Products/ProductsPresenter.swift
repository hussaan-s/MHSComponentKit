//  Created by Muhammad Hussaan Saeed on 10/31/21.

import Foundation

protocol ProductsPresenting {
    
    var view: ProductsViewing? { get set }
    
    func onChangeSegment(_ index: Int)
    
    func onApplyFilter()
}

class ProductsPresenter {
    
    weak var view: ProductsViewing?
    let interactor: ProductsInteracting
    let router: ProductsRouting
    let middleware: ProductListingMiddlewareChildType?
    
    init(interactor: ProductsInteracting,
         router: ProductsRouting,
         middleware: ProductListingMiddlewareChildType? = nil) {

        self.interactor = interactor
        self.router = router
        self.middleware = middleware
    }
    
}

extension ProductsPresenter: ProductsPresenting {
    
    func onChangeSegment(_ index: Int) {
        
    }
    
    func onApplyFilter() {
        self.middleware?.onApplyFilters()
    }
}

extension ProductsPresenter: ProductListingMiddlewareParentType {
    func productCount(_ count: Int) {
        self.view?.productCount()
    }
}
