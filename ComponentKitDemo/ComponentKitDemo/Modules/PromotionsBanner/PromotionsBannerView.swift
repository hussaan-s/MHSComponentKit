//  Created by Muhammad Hussaan Saeed on 11/8/21.

import UIKit

protocol PromotionsBannerViewing where Self: UIView{
    
    func configureBanner()
}

public class PromotionsBannerView: UIView {
    
    let presenter: PromotionsBannerPresenting

    required init(presenter: PromotionsBannerPresenting) {
        self.presenter = presenter
        super.init(frame: CGRect.zero)
        commonInit()
    }
    
    

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.isPagingEnabled = true
        scrollView.delegate = self
        return scrollView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .bottom
        stackView.distribution = .equalSpacing
        stackView.spacing = 0
        return stackView
    }()
    
    
    private func commonInit() {
        
        translatesAutoresizingMaskIntoConstraints = false
        clipsToBounds = false

        setupViews()
        setupConstraints()
    }
    
    func configureBanner() {
        
        stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        let images = ["Vector-1",
                      "Vector-2",
                      "Vector-3"]
            .compactMap { UIImage(named:$0) }
        
        for image in images {
            let imageView = UIImageView(image: image)
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.contentMode = .scaleAspectFill
            imageView.widthAnchor.constraint(equalToConstant: bounds.width).isActive = true
            stackView.addArrangedSubview(imageView)
        }
    }

}

extension PromotionsBannerView {
    
    func setupViews() {
        addSubview(scrollView)
        scrollView.addSubview(stackView)
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            bottomAnchor.constraint(equalTo: stackView.bottomAnchor)
        ])
    }
    

}


extension PromotionsBannerView: UIScrollViewDelegate {
    
}


extension PromotionsBannerView: PromotionsBannerViewing {
    
}
