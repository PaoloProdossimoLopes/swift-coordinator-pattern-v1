//
//  HomeView.swift
//  Coord
//
//  Created by Paolo Prodossimo Lopes on 24/02/22.
//

import UIKit

protocol HomeViewDelegate: AnyObject {
    func closeButtonWasTapped(sender: UIButton)
}

final class HomeView: UIView {
    
    private weak var delegate: HomeViewDelegate?
    
    private(set) var closeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(closeButtonWasTapped), for: .touchUpInside)
        return button
    }()
    
    init(_ delegate: HomeViewDelegate) {
        self.delegate = delegate
        super.init(frame: .zero)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        configureViewHierarchy()
        configureConstraints()
        configureStyle()
    }
    
    private func configureViewHierarchy() {
        addSubview(closeButton)
    }
    
    private func configureConstraints() {
        closeButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        closeButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
    private func configureStyle() {
        backgroundColor = .red
    }
    
    @objc private func closeButtonWasTapped(sender: UIButton) {
        delegate?.closeButtonWasTapped(sender: sender)
    }
}
