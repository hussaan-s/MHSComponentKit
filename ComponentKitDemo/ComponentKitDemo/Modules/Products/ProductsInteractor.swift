//  Created by Muhammad Hussaan Saeed on 10/31/21.

import Foundation


protocol ProductsInteracting: AnyObject {
    func fetchProducts(_ products: ([Product]) -> Void)
    func deleteProduct()
    func filterProducts() -> Void
}

class ProductsInteractor {
    
    var products: [Product] = []
    var filteredProducts: [Product] = []
    
}

extension ProductsInteractor: ProductsInteracting {
    
    func fetchProducts(_ products: ([Product]) -> Void) {
        
    }

    func filterProducts() {
        
    }
    
    func deleteProduct() {
        
    }
    
}
