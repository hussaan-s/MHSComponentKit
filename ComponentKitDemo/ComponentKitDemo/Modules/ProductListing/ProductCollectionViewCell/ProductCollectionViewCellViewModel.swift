//  Created by Muhammad Hussaan Saeed on 11/1/21.

import ComponentKit

protocol ProductCollectionViewCellViewModelType {
    var productComponentModel: ProductComponentModel { get }
}

class ProductCollectionViewCellViewModel {
    
    var productComponentModel: ProductComponentModel
    
    init(product: Product,
         count: Int) {
        
        self.productComponentModel = ProductComponentModel(counterComponentModel: CounterComponentModel(state: .expanded, count: "\(count)"),
                                                           cardComponentModel: CardComponentModel(state: .unselected, image: product.image, name: product.name))
        
    }
}

extension ProductCollectionViewCellViewModel: ProductCollectionViewCellViewModelType { }
