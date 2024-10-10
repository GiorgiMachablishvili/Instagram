//
//  MainViewController.swift
//  Instagram
//
//  Created by Gio's Mac on 10.10.24.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    private let fireBaseManager = FireBaseManager.shared
    
    private lazy var logOutButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setTitle("Back", for: .normal)
        view.setTitleColor(.black, for: .normal)
        view.addTarget(self, action: #selector(pressLogOutButton), for: .touchUpInside)
        return view
    }()
    
    private lazy var mainBottomButtons: MainBottomButtonView = {
        let view = MainBottomButtonView()
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupConstraints()
        view.backgroundColor = .systemBackground
    }
    
    private func setup() {
        view.addSubview(mainBottomButtons)
        view.addSubview(logOutButton)
    }
    
    private func setupConstraints() {
        logOutButton.snp.remakeConstraints { make in
            make.top.equalTo(view.snp.top).offset(100)
            make.leading.equalTo(view.snp.leading).offset(20)
            make.height.width.equalTo(40)
        }
        
        mainBottomButtons.snp.remakeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(view.snp.bottom).offset(-14)
            make.height.equalTo(50)
        }
    }
    
    @objc func pressLogOutButton() async {
        Task {
            do {
                try await fireBaseManager.signOut()
                navigateToSignInViewController()
            } catch {
                print("Failed to sign out: \(error)")
            }
        }
        print("pressed")
    }
    
    private func navigateToSignInViewController() {
        let signInVC = SignInViewController()
        let navigationController = UINavigationController(rootViewController: signInVC)
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.window?.rootViewController = navigationController
    }
}
