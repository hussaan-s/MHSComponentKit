//  Created by Muhammad Hussaan Saeed on 11/9/21.

import Foundation


protocol ProductListingMiddlewareType: ProductListingMiddlewareParentType & ProductListingMiddlewareChildType { }

protocol ProductListingMiddlewareParentType: AnyObject {
    func productCount(_ count: Int)
}

protocol ProductListingMiddlewareChildType: AnyObject {
    func onApplyFilters()
}

class ProductListingMiddleware  {
    
    weak var parent: ProductListingMiddlewareParentType?
    weak var child: ProductListingMiddlewareChildType?
    
    init(parent: ProductListingMiddlewareParentType,
         child: ProductListingMiddlewareChildType) {
        
        self.parent = parent
        self.child = child
        
    }
}

extension ProductListingMiddleware: ProductListingMiddlewareType {
    
    func productCount(_ count: Int) {
        parent?.productCount(count)
    }
    
    func onApplyFilters() {
        child?.onApplyFilters()
    }
    
}
