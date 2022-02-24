//
//  LoginView.swift
//  Coord
//
//  Created by Paolo Prodossimo Lopes on 24/02/22.
//

import UIKit

protocol LoginViewDelegate: AnyObject {
    func enterButtonWasTapped(_ sender: UIButton)
}

final class LoginView: UIView {
    
    //MARK: - Properties
    private weak var delegate: LoginViewDelegate?
    
    //MARK: - UI Components
    private(set) lazy var enterButton: UIButton = {
        let button = UIButton()
        button.setTitle("Title", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemPink
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(enterButtonWasTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //MARK: - Constructor
    
    init(delegate: LoginViewDelegate) {
        self.delegate = delegate
        super.init(frame: .zero)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers
    private func commonInit() {
        configureViewHierarchy()
        configureConstarints()
        configureStyle()
    }
    
    private func configureViewHierarchy() {
        addSubview(enterButton)
    }
    
    private func configureConstarints() {
        NSLayoutConstraint.activate([
            enterButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            enterButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            enterButton.widthAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    private func configureStyle() {
        backgroundColor = .white
    }
    
    //MARK: - Selectors
    
    @objc private func enterButtonWasTapped(_ sender: UIButton) {
        delegate?.enterButtonWasTapped(sender)
    }
}
