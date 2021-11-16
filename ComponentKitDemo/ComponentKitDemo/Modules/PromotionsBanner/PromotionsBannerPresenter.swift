//  Created by Muhammad Hussaan Saeed on 11/8/21.

import Foundation


protocol PromotionsBannerPresenting {
    var view: PromotionsBannerViewing? { get set }
    
    func viewDidLoad()
}

class PromotionsBannerPresenter {
    
    weak var view: PromotionsBannerViewing?
    let interactor: PromotionsBannerInteracting
    let router: PromotionsBannerRouting
    
    init(interactor: PromotionsBannerInteracting,
         router: PromotionsBannerRouting) {
        self.interactor = interactor
        self.router = router
    }
}

extension PromotionsBannerPresenter: PromotionsBannerPresenting {
    
    func viewDidLoad() {
        
    }
}
