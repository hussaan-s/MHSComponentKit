//  Created by Muhammad Hussaan Saeed on 11/1/21.

import UIKit
import ComponentKit

class ProductCollectionViewCell: UICollectionViewCell {
    
    lazy var productComponent: Component<ProductComponentModel, ProductComponentEvent> = {
        
        let component = Components.makeProductComponent()
        component.view.translatesAutoresizingMaskIntoConstraints = false
        return component
    }()
    
    private var viewModel: ProductCollectionViewCellViewModelType?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        setupViews()
        setupConstraints()
    }
    
    func configure(viewModel: ProductCollectionViewCellViewModelType) {
        self.viewModel = viewModel
        productComponent.update(viewModel.productComponentModel)
    }
}

extension ProductCollectionViewCell {
    
    func setupViews() {
        contentView.addSubview(productComponent.view)
    }

    func setupConstraints() {
    
        NSLayoutConstraint.activate([
            productComponent.view.topAnchor.constraint(equalTo: contentView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: productComponent.view.bottomAnchor),
            productComponent.view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: productComponent.view.trailingAnchor)
        ])

    }
    
}
