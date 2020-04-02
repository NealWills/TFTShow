//
//  HeroView.swift
//  TFTShow
//
//  Created by Neal on 2020/4/1.
//  Copyright © 2020 Neal. All rights reserved.
//

import UIKit
import SnapKit


class HeroView: UIView {
    
    var view:UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setBaseView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension HeroView {
    
    func setBaseView() {
        
        self.view = UIView()
            .set(superView: self)
            .set(snpClousure: { (make) in
                make.edges.equalTo(self)
            })
            .set(backgroundColor: .white)
            .set(layerCornerRadius: 10)
                        
        
    }
    
    func setMainView() {
        
    }
    
}


