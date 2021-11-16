//  Created by Muhammad Hussaan Saeed on 10/12/21.

import UIKit

public extension Components {
    
    enum Counter {
        
        public static func makeVerticalCounter() -> Component<CounterComponentModel, CounterComponentEvent> {
            
            let add = Views.CounterViews.add()
            let subtract = Views.CounterViews.subtract()
            let count = Views.CounterViews.count()
            let loader = Views.CounterViews.loader()
            let background = Views.CounterViews.background()
            
            func viewBuilder() -> UIView {
                return Layouts.CounterLayouts.makeVerticalCounter(background: background,
                                                                  views: [add, count, subtract],
                                                                  loader: loader)
            }
            
            
            func update(_ model: CounterComponentModel) -> Void {
                
                switch model.state {
                case .loading:
                    loader.startAnimating()
                default:
                    loader.stopAnimating()
                }
                
                count.text = model.count
            }
            
            
            func eventHandler(_ event: ((CounterComponentEvent) -> Void)) -> Void {
                
                
            }
            
            return Component(viewBuilder: viewBuilder,
                             update: update,
                             eventHandler: eventHandler)
            
        }
        
        public static func makeHorizontalCounter() -> Component<CounterComponentModel, CounterComponentEvent> {
            
            let add = Views.CounterViews.add()
            let subtract = Views.CounterViews.subtract()
            let count = Views.CounterViews.count()
            let loader = Views.CounterViews.loader()
            let background = Views.CounterViews.background()
            
            func viewBuilder() -> UIView {
                return Layouts.CounterLayouts.makeHorizontalCounter(background: background,
                                                                    views: [add, count, subtract],
                                                                    loader: loader)
            }
            
            
            func update(_ model: CounterComponentModel) -> Void {
                
                switch model.state {
                case .loading:
                    loader.startAnimating()
                default:
                    loader.stopAnimating()
                }
                
                count.text = model.count
            }
            
            
            func eventHandler(_ event: ((CounterComponentEvent) -> Void)) -> Void {
                
                
            }
            
            return Component(viewBuilder: viewBuilder,
                             update: update,
                             eventHandler: eventHandler)
            
        }
    }
    
}


extension Views {
    
    enum CounterViews {
        
        static func add() -> UIButton {
            let button = UIButton()
            button.layer.borderWidth = 1
            button.layer.cornerRadius = 5
            button.layer.borderColor = UIColor.primary.cgColor
            button.setTitleColor(.primary, for: .normal)
            button.setTitle("+", for: .normal)
            button.titleLabel?.font = button.titleLabel?.font.withSize(24)
            button.backgroundColor = .background
            return button
        }
        
        static func subtract() -> UIButton {
            let button = UIButton()
            button.layer.borderWidth = 1
            button.layer.cornerRadius = 5
            button.layer.borderColor = UIColor.primary.cgColor
            button.setTitleColor(.primary, for: .normal)
            button.setTitle("-", for: .normal)
            button.titleLabel?.font = button.titleLabel?.font.withSize(24)
            button.backgroundColor = .background
            return button
        }
        
        static func loader() -> UIActivityIndicatorView {
            let indicator = UIActivityIndicatorView()
            indicator.tintColor = .primary
            return indicator
        }
        
        static func count() -> UILabel {
            let label = UILabel()
            label.textColor = .onPrimary
            label.textAlignment = .center
            return label
        }
        
        
        static func background() -> UIView {
            let background = UIView()
            background.backgroundColor = .primary
            background.layer.cornerRadius = 5
            return background
        }
    }
    
}

extension Layouts {
    
    enum CounterLayouts {
        static func makeVerticalCounter(background: UIView,
                                        views: [UIView],
                                        loader: UIView) -> UIView {
            
            let stackView = UIStackView(arrangedSubviews: views)
            stackView.axis = .vertical
            stackView.spacing = 0
            stackView.distribution = .fillEqually
            stackView.alignment = .fill
            
            background.addSubview(stackView)
            
            stackView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                stackView.leadingAnchor.constraint(equalTo: background.leadingAnchor),
                stackView.topAnchor.constraint(equalTo: background.topAnchor),
                background.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
                background.bottomAnchor.constraint(equalTo: stackView.bottomAnchor),
            ])
            
            return background
        }
        
        static func makeHorizontalCounter(background: UIView,
                                          views: [UIView],
                                          loader: UIView) -> UIView {
            
            let stackView = UIStackView(arrangedSubviews: views)
            stackView.axis = .horizontal
            stackView.spacing = 0
            stackView.distribution = .fillEqually
            stackView.alignment = .fill
            
            background.addSubview(stackView)
            
            stackView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                stackView.leadingAnchor.constraint(equalTo: background.leadingAnchor),
                stackView.topAnchor.constraint(equalTo: background.topAnchor),
                background.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
                background.bottomAnchor.constraint(equalTo: stackView.bottomAnchor),
            ])
            
            return background
        }
    }
}
