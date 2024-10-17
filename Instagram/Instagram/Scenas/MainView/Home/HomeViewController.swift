//
//  HomeViewController.swift
//  Instagram
//
//  Created by Gio's Mac on 11.10.24.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    private let fireBaseManager = FireBaseManager.shared
    
    private lazy var logOutButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setTitle("Back", for: .normal)
        view.setTitleColor(.black, for: .normal)
        view.addTarget(self, action: #selector(pressLogOutButton), for: .touchUpInside)
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .red
        view.addSubview(logOutButton)
        
        logOutButton.snp.remakeConstraints { make in
            make.top.equalTo(view.snp.top).offset(100 * Constraint.yCoeff)
            make.leading.equalTo(view.snp.leading).offset(20 * Constraint.xCoeff)
            make.height.width.equalTo(40 * Constraint.yCoeff)
        }

    }
    
    @objc func pressLogOutButton() {
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
