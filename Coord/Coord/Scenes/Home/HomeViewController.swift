//
//  HomeViewController.swift
//  Coord
//
//  Created by Paolo Prodossimo Lopes on 24/02/22.
//

import UIKit

final class HomeViewController: UIViewController {
    
    private var viewModel: HomeViewModelProtocol { didSet{ viewModel.viewDelegate = self } }
    private lazy var homeView = HomeView(self)
    
    init(viewModel: HomeViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

//MARK: - HomeViewModelToCoordinatorDelegate
extension HomeViewController: HomeViewModelToViewDelegate {
    func updateView() { print("Update view") }
}

extension HomeViewController: HomeViewDelegate {
    func closeButtonWasTapped(sender: UIButton) {
        viewModel.closeButtonWasTapped(from: self, sender: sender)
    }
}
