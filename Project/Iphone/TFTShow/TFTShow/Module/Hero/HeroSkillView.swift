//
//  HeroSkillView.swift
//  TFTShow
//
//  Created by Neal on 2020/4/6.
//  Copyright © 2020 Neal. All rights reserved.
//

import Foundation

import UIKit

class HeroSkillView: HeroDeatilBaseView {
    
    var iconSkill: UIImageView!
    var lblSkillName: UILabel!
    var lblSkillDes: UILabel!
    var lblDamage: UILabel!
    var lblSheild: UILabel!
    
}

extension HeroDetailProtocol where Self:HeroSkillView {
    
    func setMain() {
        self.set(title: "ABILITY")
        
        self.iconSkill = UIImageView()
            .set(superView: self.view)
            .set(snpClousure: { (make) in
                make.leading.equalTo(self.view.snp.leading).offset(15)
                make.top.equalTo(self.view.snp.top).offset(15)
                make.width.height.equalTo(50)
            })
            .set(viewMode: .scaleAspectFill)
            .set(img: UIImage.init(named: ""))
        
    }
    
    
    
    
    @discardableResult
    func set(hero: HeroBase) -> Self {
        return self
    }
    
}
