//
//  UIStackView+.swift
//  CDS_YES24
//
//  Created by 강윤서 on 2022/11/14.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: UIView...) {
        views.forEach{self.addArrangedSubview($0)}
    }
}
