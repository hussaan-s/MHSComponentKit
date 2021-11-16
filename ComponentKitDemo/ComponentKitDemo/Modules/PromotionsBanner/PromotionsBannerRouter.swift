//  Created by Muhammad Hussaan Saeed on 11/8/21.

import UIKit

protocol PromotionsBannerRouting { }


class PromotionsBannerRouter {
    
    static func assemblePromotionBannerModule() -> UIView {
        
        let interactor: PromotionsBannerInteracting = PromotionsBannerInteractor()
        
        let router: PromotionsBannerRouting = PromotionsBannerRouter()
        
        var presenter: PromotionsBannerPresenting = PromotionsBannerPresenter(interactor: interactor,
                                                                              router: router)
        
        
        let view: PromotionsBannerViewing = PromotionsBannerView(presenter: presenter)
        
        presenter.view = view
        
        return view
        
    }
    
}

extension PromotionsBannerRouter: PromotionsBannerRouting { }
