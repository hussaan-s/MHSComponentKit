//  Created by Muhammad Hussaan Saeed on 11/8/21.

import Foundation

protocol ProductListingInteracting: AnyObject {
    func fetchProducts(_ products: ([Product]) -> Void)
    func onApplyFilters()
}

class ProductListingInteractor {
    
    var service: ProductsServiceType
    
    init(service: ProductsServiceType) {
        self.service = service
    }
}

extension ProductListingInteractor: ProductListingInteracting {
    
    func fetchProducts(_ products: ([Product]) -> Void) {
        products(self.service.fetchProducts())
        
    }

    func onApplyFilters() {
        
    }
}

