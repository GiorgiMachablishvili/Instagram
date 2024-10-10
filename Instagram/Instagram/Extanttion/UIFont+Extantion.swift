//
//  UIFont+Extantion.swift
//  Instagram
//
//  Created by Gio's Mac on 09.10.24.
//

import UIKit

extension UIFont {
    //MARK: font extension
    static func KoronaOneRegular(size: CGFloat) -> UIFont {
        return UIFont(name: "KronaOne-Regular", size: size) ?? .systemFont(ofSize: size)
    }
    
    static func BillabongRegular(size: CGFloat) -> UIFont {
        return UIFont(name: "billabong_regular", size: size) ?? .systemFont(ofSize: size)
    }
    
    static func Billabong(size: CGFloat) -> UIFont {
        return UIFont(name: "billabong", size: size) ?? .systemFont(ofSize: size)
    }
}
