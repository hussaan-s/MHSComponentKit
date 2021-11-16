//  Created by Muhammad Hussaan Saeed on 11/8/21.

import UIKit

protocol ProductsServiceType {
    func fetchProducts() -> [Product]
}


class ProductsService: ProductsServiceType {
    
    
    func fetchProducts() -> [Product] {
        
        return [
            Product(name: "Apple", image: UIImage(named: "apple")! , price: "10,0"),
            Product(name: "Coffee Filters", image: UIImage(named: "coffee_filters")!, price: "30,0"),
            Product(name: "Honey Mustard", image: UIImage(named: "honey_mustard")!, price: "5,0"),
            Product(name: "Kiwi", image: UIImage(named: "kiwi")!, price: "8,0"),
            Product(name: "Mango", image: UIImage(named: "mango")!, price: "11,0"),
            Product(name: "Mixed Vegetables", image: UIImage(named: "mixed_vegetables")!, price: "13,0"),
            Product(name: "Pickled", image: UIImage(named: "pickled_turnips")!, price: "10,0"),
            Product(name: "Pro Snacks", image: UIImage(named: "pro_snacks")!, price: "15,0")
        ]
        
    }
    
}
