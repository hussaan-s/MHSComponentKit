//  Created by Muhammad Hussaan Saeed on 11/4/21.

import UIKit

public struct ProductComponentModel {
    
    let counterComponentModel: CounterComponentModel
    let cardComponentModel: CardComponentModel
    
    public init(counterComponentModel: CounterComponentModel,
                cardComponentModel: CardComponentModel) {
        self.counterComponentModel = counterComponentModel
        self.cardComponentModel = cardComponentModel
    }
        
        
}



