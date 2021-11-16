//  Created by Muhammad Hussaan Saeed on 11/4/21.

import UIKit

extension Layouts {
    
    enum Product {
        
        static func makeProduct(card: UIView,
                                counter: UIView) -> UIView {
            
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = .clear
            
            card.translatesAutoresizingMaskIntoConstraints = false
            counter.translatesAutoresizingMaskIntoConstraints = false
            
            view.addSubview(card)
            view.addSubview(counter)
            
            NSLayoutConstraint.activate([
                card.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                view.bottomAnchor.constraint(equalTo: card.bottomAnchor),
                card.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
                view.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: 20)
            ])
            
            NSLayoutConstraint.activate([
                counter.topAnchor.constraint(equalTo: view.topAnchor),
                counter.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                counter.widthAnchor.constraint(equalToConstant: 30),
                counter.heightAnchor.constraint(equalToConstant: 90)
            ])
        
            return view
        }
    }
    
}


extension Components {
    
    public static func makeProductComponent() -> Component<ProductComponentModel, ProductComponentEvent> {
        
        let image = Views.Cards.image()
        let name = Views.Cards.name()
        
        let add = Views.CounterViews.add()
        let subtract = Views.CounterViews.subtract()
        let count = Views.CounterViews.count()
        let loader = Views.CounterViews.loader()
        let background = Views.CounterViews.background()
        
        func viewBuilder() -> UIView {
            
            let card = Layouts.Cards.makeCard(views: [image, name])
            let counter = Layouts.CounterLayouts.makeVerticalCounter(background: background,
                                                                     views: [add, count, subtract],
                                                                     loader: loader)
            
            
            return Layouts.Product.makeProduct(card: card,
                                               counter: counter)
        }
        
       
        func update(_ model: ProductComponentModel) -> Void {
            count.text = model.counterComponentModel.count
            image.image = model.cardComponentModel.image
            name.text = model.cardComponentModel.name
        }
        
        
        func eventHandler(_ event: ((ProductComponentEvent) -> Void)) -> Void {
            
            
        }
        
        return Component(viewBuilder: viewBuilder,
                         update: update,
                         eventHandler: eventHandler)
        
    }
    
}
