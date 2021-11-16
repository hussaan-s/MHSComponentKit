//  Created by Muhammad Hussaan Saeed on 10/7/21.

import UIKit
import ComponentKit

protocol MainViewing where Self: UIViewController {
    var presenter: MainPresenting { get set }
    var navigationController: UINavigationController? { get }
}

class MainViewController: UIViewController {
    
    var presenter: MainPresenting
    
    init(presenter: MainPresenting) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var button: UIButton = {
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("PRODUCT", for: .normal)
        button.addTarget(self, action: #selector(onTapButton), for: .touchUpInside)
        button.backgroundColor = .onBackground
        button.layer.cornerRadius = 5
        button.titleLabel?.font = .systemFont(ofSize: 12, weight: .bold)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
    }
    
    @objc
    func onTapButton() {
        presenter.onTapProduct()
    }
}

extension MainViewController {
 
    func setupViews() {
        view.backgroundColor = .background
        view.addSubview(button)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: 150),
            button.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
    
}

extension MainViewController: MainViewing { }
