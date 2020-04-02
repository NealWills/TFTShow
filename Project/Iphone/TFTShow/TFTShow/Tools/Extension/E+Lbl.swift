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
    func set(title: String) -> Self {
        self.text = title
        return self
    }
}
