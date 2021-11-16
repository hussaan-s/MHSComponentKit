//  Created by Muhammad Hussaan Saeed on 10/31/21.

import UIKit

protocol ProductsViewing where Self: UIViewController {
    var presenter: ProductsPresenting { get set }
    var listViewController: UIViewController? { get set }
    func productCount()
}

class ProductsViewController: UIViewController {
    
    var presenter: ProductsPresenting
    
    var listViewController: UIViewController?
    
    init(presenter: ProductsPresenting) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    lazy var segmentedControl: UISegmentedControl = {
        
        let control = UISegmentedControl(items: ["List A (10)", "List B (5)"])
        control.translatesAutoresizingMaskIntoConstraints = false
        control.selectedSegmentIndex = 0
        control.addTarget(self, action: #selector(didChangeSegment), for: .valueChanged)
        return control
        
    }()
    
    
    lazy var listContainer: UIView = {
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    lazy var filter: UIBarButtonItem = {
        let item = UIBarButtonItem(title: "Filter", style: .plain, target: self, action: #selector(didTapFilter))
        return item
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupConstraints()
    }

    @objc
    func didChangeSegment() {
        presenter.onChangeSegment(segmentedControl.selectedSegmentIndex)
    }
    
    @objc
    func didTapFilter() {
    
    }
}

private extension ProductsViewController {
    

    func setupViews() {
        view.backgroundColor = .background
        view.addSubview(segmentedControl)
        view.addSubview(listContainer)
        navigationItem.rightBarButtonItem = filter
    
        if let viewController = listViewController {
            viewController.view.translatesAutoresizingMaskIntoConstraints = false
            addChild(viewController)
            listContainer.addSubview(viewController.view)
            viewController.didMove(toParent: self)
            NSLayoutConstraint.activate([
                listContainer.trailingAnchor.constraint(equalTo: viewController.view.trailingAnchor),
                viewController.view.topAnchor.constraint(equalTo: listContainer.topAnchor),
                viewController.view.leadingAnchor.constraint(equalTo: listContainer.leadingAnchor),
                listContainer.bottomAnchor.constraint(equalTo: viewController.view.bottomAnchor)
            ])
        }
    
    }

    func setupConstraints() {
        
        if #available(iOS 11.0, *) {
            segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        } else {
            segmentedControl.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        }
        
        
        NSLayoutConstraint.activate([
            segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            view.trailingAnchor.constraint(equalTo: segmentedControl.trailingAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            listContainer.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor),
            listContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: listContainer.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: listContainer.bottomAnchor)
        ])
    }
}

extension ProductsViewController: ProductsViewing {
    
    func productCount() {
        // Display count
    }
    
}

