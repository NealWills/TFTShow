//
//  E+UIImageView.swift
//  TFTShow
//
//  Created by Neal on 2020/4/5.
//  Copyright © 2020 Neal. All rights reserved.
//

import Foundation
import UIKit

extension BaseViewSetProtocol where Self: UIImageView {
    
    @discardableResult
    func set(img: UIImage?) -> Self {
        self.image = img
        return self
    }
}

