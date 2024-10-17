//
//  PostViewCell.swift
//  Instagram
//
//  Created by Gio's Mac on 16.10.24.
//

import UIKit
import SnapKit

class PostViewCell: UICollectionViewCell {
    private lazy var postImage: UIImageView = {
        let view = UIImageView(frame: .zero)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        addSubview(postImage)
    }
    
    private func setupConstraints() {
        postImage.snp.remakeConstraints { make in
            make.edges.equalToSuperview().inset(1)
        }
    }
    
    func configure() {
        let randomColor = UIColor(
            red: CGFloat.random(in: 0...1),
            green: CGFloat.random(in: 0...1),
            blue: CGFloat.random(in: 0...1),
            alpha: 1.0
        )
        postImage.backgroundColor = randomColor
    }
}

