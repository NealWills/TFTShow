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
    func set(img: UIImage?) -> Self {
        self.setImage(img ?? UIImage(), for: .normal)
        return self
    }
}
