//
//  UILabel+.swift
//  CDS_YES24
//
//  Created by Mac Book Pro on 2022/11/21.
//

import UIKit

extension UILabel{
    func asColor(targetString: String, color: UIColor) {
            let fullText = text ?? ""
            let attributedString = NSMutableAttributedString(string: fullText)
            let range = (fullText as NSString).range(of: targetString)
            attributedString.addAttribute(.foregroundColor, value: color, range: range)
            attributedText = attributedString
        }
}

