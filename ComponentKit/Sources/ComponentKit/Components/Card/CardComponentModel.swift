//  Created by Muhammad Hussaan Saeed on 10/28/21.

import UIKit

public enum CardComponentState {
    case selected
    case unselected
}


public struct CardComponentModel {
    
    let state: CardComponentState
    let image: UIImage
    let name: String
    
    public init(state: CardComponentState,
                image: UIImage,
                name: String) {
        self.state = state
        self.image = image
        self.name = name
    }
}
