//
//  UIView+.swift
//  CDS_YES24
//
//  Created by 강윤서 on 2022/11/14.
//

import UIKit

extension UIView {
    func addSubViews(_ views: UIView...) {
        views.forEach{self.addSubview($0)}
    }
}
