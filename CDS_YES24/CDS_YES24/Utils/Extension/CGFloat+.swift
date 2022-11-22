//
//  CGFloat+.swift
//  CDS_YES24
//
//  Created by Mac Book Pro on 2022/11/21.
//

import UIKit

extension CGFloat {
    var adjusted: CGFloat {
        let ratio: CGFloat = UIScreen.main.bounds.width / 390
        let ratioH: CGFloat = UIScreen.main.bounds.height / 844
        return ratio <= ratioH ? self * ratio : self * ratioH
    }
}
