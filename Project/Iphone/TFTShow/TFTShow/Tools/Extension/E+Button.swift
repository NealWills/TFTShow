//
//  E+Button.swift
//  TFTShow
//
//  Created by Neal on 2020/4/3.
//  Copyright © 2020 Neal. All rights reserved.
//

import Foundation
import UIKit

extension BaseViewSetProtocol where Self: UIButton {
    
    @discardableResult
    func set(img: UIImage?) -> Self {
        self.setImage(img ?? UIImage(), for: .normal)
        return self
    }
    
    @discardableResult
    func set(title: String) -> Self {
        self.setTitle(title, for: .normal)
        return self
    }
    
    @discardableResult
    func set(foregroundColor: UIColor) -> Self {
        self.setTitleColor(foregroundColor, for: .normal)
        return self
    }
    
    @discardableResult
    func set(font: UIFont) -> Self {
        self.titleLabel?.font = font
        return self
    }
    
}
