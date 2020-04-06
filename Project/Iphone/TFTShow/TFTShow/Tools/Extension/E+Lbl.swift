//
//  E+Lbl.swift
//  TFTShow
//
//  Created by Neal on 2020/4/3.
//  Copyright © 2020 Neal. All rights reserved.
//

import Foundation
import UIKit

extension BaseViewSetProtocol where Self: UILabel {
    
    @discardableResult
    func set(title: String) -> Self {
        self.text = title
        return self
    }
    
    @discardableResult
    func set(foregroundColor: UIColor) -> Self {
        self.textColor = foregroundColor
        return self
    }
    
    @discardableResult
    func set(font: UIFont) -> Self {
        self.font = font
        return self
    }
    
}
