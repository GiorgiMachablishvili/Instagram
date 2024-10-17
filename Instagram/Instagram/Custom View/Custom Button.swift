//
//  Custom Button.swift
//  Instagram
//
//  Created by Gio's Mac on 17.10.24.
//

import UIKit
import SnapKit

class CustomButton: UIButton {
    
//    private let leftImageView = UIImageView()
//    private let titleNameLabel = UILabel()
//    private let rightImageView = UIImageView()
//    private let hStack = UIStackView()
//
//    init(leftImage: UIImage?, title: String, rightImage: UIImage?) {
//        super.init(frame: .zero)
//        
//        // Configure left image
//        leftImageView.image = leftImage
//        leftImageView.contentMode = .scaleAspectFit
//        leftImageView.tintColor = .black
//        
//        // Configure title
//        titleNameLabel.text = title
//        titleNameLabel.textColor = .black
//        titleNameLabel.textAlignment = .center
//        
//        // Configure right image
//        rightImageView.image = rightImage
//        rightImageView.contentMode = .scaleAspectFit
//        rightImageView.tintColor = .black
//        
//        // Set up horizontal stack view
//        hStack.axis = .horizontal
//        hStack.spacing = 5
//        hStack.alignment = .center
//        hStack.addArrangedSubview(leftImageView)
//        hStack.addArrangedSubview(titleNameLabel)
//        hStack.addArrangedSubview(rightImageView)
//        
//        addSubview(hStack)
//        
//        // Set up constraints
//        hStack.snp.makeConstraints { make in
//            make.edges.equalToSuperview().inset(5)
//        }
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
        private let leftImageView = UIImageView()
        private let titleNameLabel = UILabel()
        private let rightImageView = UIImageView()
        private let hStack = UIStackView()

        init(leftImage: UIImage?, title: String, rightImage: UIImage?) {
            super.init(frame: .zero)
            
            // Configure left image
            leftImageView.image = leftImage
            leftImageView.contentMode = .scaleAspectFit
            leftImageView.tintColor = .black
            
            // Configure title
            titleNameLabel.text = title
            titleNameLabel.textColor = .black
            titleNameLabel.textAlignment = .left
            
            // Configure right image
            rightImageView.image = rightImage
            rightImageView.contentMode = .scaleAspectFit
            rightImageView.tintColor = .black
            
            // Add subviews to the button
            addSubview(leftImageView)
            addSubview(titleNameLabel)
            addSubview(rightImageView)
            
            // Set up constraints for left image
            leftImageView.snp.makeConstraints { make in
                make.leading.equalToSuperview().offset(10)
                make.centerY.equalToSuperview()
                make.width.height.equalTo(20) // Adjust the size of the image as needed
            }
            
            // Set up constraints for title
            titleNameLabel.snp.makeConstraints { make in
                make.leading.equalTo(leftImageView.snp.trailing).offset(25)
                make.centerY.equalToSuperview()
            }
            
            // Set up constraints for right image
            rightImageView.snp.makeConstraints { make in
                make.leading.equalTo(titleNameLabel.snp.trailing).offset(60)
                make.trailing.equalToSuperview().offset(-10)
                make.centerY.equalToSuperview()
                make.width.height.equalTo(20) // Adjust the size of the image as needed
            }
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
}
