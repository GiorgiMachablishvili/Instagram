//
//  MainViewController.swift
//  Instagram
//
//  Created by Gio's Mac on 10.10.24.
//

import UIKit
import SnapKit

protocol MainBottomButtonViewDelegate: AnyObject {
    func pressHomeButton()
    func pressSearchButton()
    func pressPlusButton()
    func pressVideoButton()
    func pressProfileButton()
}

class MainViewController: UIViewController, MainBottomButtonViewDelegate {
    private let fireBaseManager = FireBaseManager.shared
    
    private lazy var mainBottomButtons: MainBottomButtonView = {
        let view = MainBottomButtonView()
        view.delegate = self
        return view
    }()
    
    private lazy var homeVC = HomeViewController()
    private lazy var searchVC = SearchViewController()
    private lazy var plusVC = PlusViewController()
    private lazy var videoVC = VideoViewController()
    private lazy var profileVC = ProfileViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupConstraints()
        view.backgroundColor = .systemBackground
        
        addChildView(homeVC)
        mainBottomButtons.homeButton.setImage(UIImage(systemName: "house.fill"), for: .normal)
        switchToViewController(homeVC)
    }
    
    private func setup() {
        view.addSubview(mainBottomButtons)
    }
    
    private func setupConstraints() {
        mainBottomButtons.snp.remakeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(view.snp.bottom).offset(-14)
            make.height.equalTo(50)
        }
    }
    
    func pressHomeButton() {
        switchToViewController(homeVC)
        mainBottomButtons.homeButton.setImage(UIImage(systemName: "house.fill"), for: .normal)
    }
    
    func pressSearchButton() {
        switchToViewController(searchVC)
        mainBottomButtons.searchButton.setImage(UIImage(systemName: "magnifyingglass.circle.fill"), for: .normal)
    }
    
    func pressPlusButton() {
        switchToViewController(plusVC)
        mainBottomButtons.plusButton.setImage(UIImage(systemName: "plus.app.fill"), for: .normal)
    }
    
    func pressVideoButton() {
        switchToViewController(videoVC)
        mainBottomButtons.videoButton.setImage(UIImage(systemName: "video.fill"), for: .normal)
    }
    
    func pressProfileButton() {
        switchToViewController(profileVC)
        mainBottomButtons.profileButton.setImage(UIImage(systemName: "person.crop.circle.fill"), for: .normal)
    }
    
    private func switchToViewController(_ newVC: UIViewController) {
        // Remove current child VC
        children.forEach { childVC in
            childVC.willMove(toParent: nil)
            childVC.view.removeFromSuperview()
            childVC.removeFromParent()
        }
        
        // Add new child VC
        addChildView(newVC)
    }
    
    private func addChildView(_ childVC: UIViewController) {
        addChild(childVC)
        view.insertSubview(childVC.view, belowSubview: mainBottomButtons)
        childVC.view.frame = view.bounds
        childVC.didMove(toParent: self)
    }
}

