//  Created by Muhammad Hussaan Saeed on 10/16/21.

import Foundation

public enum CounterComponentState {
    case collapsed
    case loading
    case expanded
}


public struct CounterComponentModel {
    
    let state: CounterComponentState
    let count: String
    
    public init(state: CounterComponentState,
         count: String) {
        self.state = state
        self.count = count
    }
}
