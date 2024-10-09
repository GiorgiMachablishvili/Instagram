//
//  LaunchViewController.swift
//  Instagram
//
//  Created by Gio's Mac on 09.10.24.
//

import UIKit
import SnapKit

class LaunchViewController: UIViewController {
    private lazy var logoView: LogoView = {
        let view = LogoView()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setup()
        layout()
    }
    private func setup() {
        view.addSubview(logoView)
        
    }
    
    private func layout() {
        logoView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalToSuperview()
        }
    }
    
}

