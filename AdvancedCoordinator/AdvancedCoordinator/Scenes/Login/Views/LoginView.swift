//
//  LoginView.swift
//  AdvancedCoordinator
//
//  Created by Paolo Prodossimo Lopes on 27/02/22.
//

import UIKit

protocol LoginViewDelegate: AnyObject {
    func registerButtonWasTapped()
}

final class LoginView: UIView {
    
    private(set) weak var delegate: LoginViewDelegate?
    
    private(set) lazy var emailTextField: UITextField = {
        let spacer = UIView()
        spacer.translatesAutoresizingMaskIntoConstraints = false
        spacer.widthAnchor.constraint(equalToConstant: 10).isActive = true
        
        let textField = UITextField()
        textField.textColor = .black
        textField.attributedPlaceholder = NSAttributedString(
            string: "E-mail", attributes: [.foregroundColor: UIColor.lightGray]
        )
        textField.backgroundColor = .white
        textField.leftView = spacer
        textField.rightView = spacer
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 5
        textField.leftViewMode = .always
        textField.rightViewMode = .always
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        return textField
    }()
    
    private(set) lazy var passwordTextField: UITextField = {
        let spacer = UIView()
        spacer.translatesAutoresizingMaskIntoConstraints = false
        spacer.widthAnchor.constraint(equalToConstant: 10).isActive = true
        
        let textField = UITextField()
        textField.textColor = .black
        textField.attributedPlaceholder = NSAttributedString(
            string: "Senha", attributes: [.foregroundColor: UIColor.lightGray]
        )
        textField.backgroundColor = .white
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 5
        textField.leftView = spacer
        textField.rightView = spacer
        textField.leftViewMode = .always
        textField.rightViewMode = .always
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        return textField
    }()
    
    private(set) lazy var registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Registar-se", for: .normal)
        button.setTitleColor(.systemRed, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 16)
        button.backgroundColor = .white.withAlphaComponent(0)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(registerButtonHandleTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var tfStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [emailTextField, passwordTextField])
        stack.spacing = 10
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    init(_ delegate: LoginViewDelegate) {
        self.delegate = delegate
        super.init(frame: .zero)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        configureHierarchy()
        configureConstants()
        configureStyle()
    }
    
    private func configureHierarchy() {
        addSubview(tfStackView)
        addSubview(registerButton)
    }
    
    private func configureConstants() {
        NSLayoutConstraint.activate([
            tfStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            tfStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            tfStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            registerButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10),
            registerButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            registerButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
    }
    
    private func configureStyle() {
        backgroundColor = .white
    }
    
    @objc private func registerButtonHandleTapped() {
        delegate?.registerButtonWasTapped()
    }
}
