//
//  UILabel+.swift
//  CDS_YES24
//
//  Created by 강윤서 on 2022/11/25.
//

import UIKit

extension UILabel {
    func partColorChange(targetString: String, textColor: UIColor) {
        let fullText = self.text ?? ""
        let range = (fullText as NSString).range(of: targetString)
        let attributedString = NSMutableAttributedString(string: fullText)
        attributedString.addAttribute(.foregroundColor, value: textColor, range: range)
        self.attributedText = attributedString
    }
}
