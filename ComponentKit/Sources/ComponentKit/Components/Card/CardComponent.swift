//  Created by Muhammad Hussaan Saeed on 10/28/21.

import Foundation
import UIKit


extension Views {
    
    enum Cards {
        
        static func image() -> UIImageView {
            let imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.contentMode = .scaleAspectFit
            return imageView
        }
        
        static func name() -> UILabel {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textColor = .onBackground
            label.textAlignment = .center
            return label
        }
        
    }
}


extension Layouts {
    
    enum Cards {
        
        static func makeCard(views: [UIView]) -> UIView {
            
            let stackView = UIStackView(arrangedSubviews: views)
            stackView.axis = .vertical
            stackView.spacing = 0
            stackView.distribution = .fillEqually
            stackView.alignment = .fill
            
            return stackView

        }
    }
    
}


extension Components {
    
    static func makeCardComponent() -> Component<CardComponentModel, CardComponentModel> {
        
        let image = Views.Cards.image()
        let name = Views.Cards.name()
        
        func viewBuilder() -> UIView {
            return Layouts.Cards.makeCard(views: [image, name])
        }
        
        
        func update(_ model: CardComponentModel) -> Void {
            
            image.image = model.image
            name.text = model.name
        }
        
        
        func eventHandler(_ event: ((CardComponentModel) -> Void)) -> Void {
            
            
        }
        
        return Component(viewBuilder: viewBuilder,
                         update: update,
                         eventHandler: eventHandler)
        
    }
    
}
