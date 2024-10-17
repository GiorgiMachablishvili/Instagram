//
//  YourAppAndMediaViewCell.swift
//  Instagram
//
//  Created by Gio's Mac on 18.10.24.
//

import UIKit
import SnapKit

class YourAppAndMediaViewCell: UICollectionViewCell {
    private lazy var mainLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.KoronaOneRegular(size: 14)
        view.textColor = .systemGray3
        view.textAlignment = .left
        view.text = "Your app and media"
        return view
    }()
    
    private lazy var devicePermissionsButton: CustomButton = {
        let view = CustomButton(
            leftImage: UIImage(systemName: "iphone.gen2"),
            title: "Device permissions",
            rightImage: UIImage(systemName: "chevron.forward")
        )
        return view
    }()
    
    private lazy var ArchivingAndDownloadingButton: CustomButton = {
        let view = CustomButton(
            leftImage: UIImage(systemName: "square.and.arrow.down"),
            title: "Archiving and downloading",
            rightImage: UIImage(systemName: "chevron.forward")
        )
        return view
    }()
    
    private lazy var accessibilityAndTranslationsButton: CustomButton = {
        let view = CustomButton(
            leftImage: UIImage(systemName: "accessibility"),
            title: "Accessibility and translations",
            rightImage: UIImage(systemName: "chevron.forward")
        )
        return view
    }()
    
    private lazy var languageButton: CustomButton = {
        let view = CustomButton(
            leftImage: UIImage(systemName: "character.book.closed"),
            title: "Language",
            rightImage: UIImage(systemName: "chevron.forward")
        )
        return view
    }()
    
    private lazy var mediaQualityButton: CustomButton = {
        let view = CustomButton(
            leftImage: UIImage(systemName: "waveform"),
            title: "Media quality",
            rightImage: UIImage(systemName: "chevron.forward")
        )
        return view
    }()
    
    private lazy var appWebsitePermissionsButton: CustomButton = {
        let view = CustomButton(
            leftImage: UIImage(systemName: "laptopcomputer"),
            title: "App website permissions",
            rightImage: UIImage(systemName: "chevron.forward")
        )
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        setupConstraint()
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        addSubview(mainLabel)
        addSubview(devicePermissionsButton)
        addSubview(ArchivingAndDownloadingButton)
        addSubview(accessibilityAndTranslationsButton)
        addSubview(languageButton)
        addSubview(mediaQualityButton)
        addSubview(appWebsitePermissionsButton)
    }
    
    private func setupConstraint() {
        mainLabel.snp.remakeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(10)
            make.leading.equalTo(snp.leading).inset(10)
            make.height.equalTo(25)
        }
        devicePermissionsButton.snp.remakeConstraints { make in
            make.top.equalTo(mainLabel.snp.bottom).offset(10)
            make.leading.equalTo(snp.leading).offset(10)
            make.height.equalTo(50 * Constraint.yCoeff)
            make.width.equalTo(350 * Constraint.xCoeff)
        }
        ArchivingAndDownloadingButton.snp.remakeConstraints { make in
            make.top.equalTo(devicePermissionsButton.snp.bottom).offset(10)
            make.leading.equalTo(snp.leading).offset(10)
            make.height.equalTo(50 * Constraint.yCoeff)
            make.width.equalTo(350 * Constraint.xCoeff)
        }
        accessibilityAndTranslationsButton.snp.remakeConstraints { make in
            make.top.equalTo(ArchivingAndDownloadingButton.snp.bottom).offset(10)
            make.leading.equalTo(snp.leading).offset(10)
            make.height.equalTo(50 * Constraint.yCoeff)
            make.width.equalTo(350 * Constraint.xCoeff)
        }
        languageButton.snp.remakeConstraints { make in
            make.top.equalTo(accessibilityAndTranslationsButton.snp.bottom).offset(10)
            make.leading.equalTo(snp.leading).offset(10)
            make.height.equalTo(50 * Constraint.yCoeff)
            make.width.equalTo(350 * Constraint.xCoeff)
        }
        mediaQualityButton.snp.remakeConstraints { make in
            make.top.equalTo(languageButton.snp.bottom).offset(10)
            make.leading.equalTo(snp.leading).offset(10)
            make.height.equalTo(50 * Constraint.yCoeff)
            make.width.equalTo(350 * Constraint.xCoeff)
        }
        appWebsitePermissionsButton.snp.remakeConstraints { make in
            make.top.equalTo(mediaQualityButton.snp.bottom).offset(10)
            make.leading.equalTo(snp.leading).offset(10)
            make.height.equalTo(50 * Constraint.yCoeff)
            make.width.equalTo(350 * Constraint.xCoeff)
        }
    }
}
