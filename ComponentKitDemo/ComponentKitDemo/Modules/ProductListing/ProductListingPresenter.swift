//  Created by Muhammad Hussaan Saeed on 11/8/21.

import Foundation


protocol ProductListingPresenting {
    var view: ProductListingViewing? { get set }
    
    func viewDidLoad()
}

class ProductListingPresenter {
    
    weak var view: ProductListingViewing?
    let interactor: ProductListingInteracting
    let router: ProductListingRouting
    var middleware: ProductListingMiddlewareParentType?
    
    init(interactor: ProductListingInteracting,
         router: ProductListingRouting,
         middleware: ProductListingMiddlewareParentType? = nil) {
        self.interactor = interactor
        self.router = router
        self.middleware = middleware
    }
}

extension ProductListingPresenter: ProductListingPresenting {
    
    func viewDidLoad() {
        interactor.fetchProducts { products in
            
            let viewModels = products.map { ProductCollectionViewCellViewModel(product: $0, count: (0...10).randomElement()! ) }
            view?.listProducts(viewModels)
            
            self.middleware?.productCount(products.count)
        }
    }
    
}


extension ProductListingPresenter: ProductListingMiddlewareChildType {
    func onApplyFilters() {
        self.interactor.onApplyFilters()
    }
}
