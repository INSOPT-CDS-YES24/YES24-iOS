//
//  UIFont+.swift
//  CDS_YES24
//
//  Created by 강윤서 on 2022/11/14.
//

import UIKit

extension UIFont {
    
    // MARK: - Pretendard
    public enum pretendardType: String {
        case semiBold = "SemiBold"
        case bold = "Bold"
        case regular = "Regular"
        case medium = "Medium"
    }
    
    static func pretendard(_ type: pretendardType, size: CGFloat) -> UIFont {
        return UIFont(name: "Pretendard-\(type.rawValue)", size: size)!
    }
    
    // MARK: - Gill Sans
    public enum gillSansType: String {
        case boldItalic = "BoldItalic"
    }
    
    static func gillSans(size: CGFloat) -> UIFont {
        return UIFont(name: "GillSans-\(gillSansType.boldItalic)", size: size)!
    }
    
    // MARK: - Helvetica
    static func helvetica(size: CGFloat) -> UIFont {
        return UIFont(name: "Helvetica-BoldItalic", size: size)!
    }
}
