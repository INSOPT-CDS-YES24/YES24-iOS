//
//  getClassName.swift
//  CDS_YES24
//
//  Created by 강윤서 on 2022/11/22.
//

import Foundation
import UIKit

/**

  - Description:
 
          각 VC,TVC,CVC의 className을 String으로 가져올 수 있도록 연산 프로퍼티를 설정합니다.
 */

extension NSObject {
  
    static var className: String {
        NSStringFromClass(self.classForCoder()).components(separatedBy: ".").last!
    }
     var className: String {
        NSStringFromClass(self.classForCoder).components(separatedBy: ".").last!
    }
}
