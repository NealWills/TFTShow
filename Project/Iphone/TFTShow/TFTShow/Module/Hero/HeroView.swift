//
//  HeroView.swift
//  TFTShow
//
//  Created by Neal on 2020/4/1.
//  Copyright © 2020 Neal. All rights reserved.
//

import UIKit
import SnapKit


class HeroView: PopViewBase {
    var imgBg : UIImageView!
    var imgM: UIButton!
    var vInfo: UIView!
    var lblName: UILabel!
    var btnCast: UIButton!
    var btnTrait0: UIButton!
    var btnTrait1: UIButton!
    var btnTrait2: UIButton!
    var btnTrait3: UIButton!
    
    let tagBase = 600100
}

protocol HeroViewPopProtocol: PopBaseProtocol { }

extension HeroViewPopProtocol where Self: HeroView { }

extension HeroView: HeroViewPopProtocol {
    
    func setMain() {
        
        self.view = UIView()
            .set(superView: self)
            .set(snpClousure: { [weak self] (make) in
                make.center.equalTo(self!)
                make.width.equalTo(300)
                make.height.equalTo(210)
            })
            .set(backgroundColor: .white)
            .set(layerCornerRadius: 10, layerMaskToBounds: false)
        
        self.imgBg = UIImageView()
            .set(superView: self.view)
            .set(snpClousure: { [weak self] (make) in
                make.edges.equalTo((self?.view)!)
            })
            .set(viewMode: .scaleAspectFill)
            .set(layerCornerRadius: 10, layerMaskToBounds: true)
        
        self.imgM = UIButton()
            .set(superView: self.view)
            .set(snpClousure: { [weak self] (make) in
                make.edges.equalTo((self?.view)!)
            })
            .set(layerCornerRadius: 10)
            .set(backgroundColor: UIColor.init(white: 0, alpha: 0.15))
        
        self.vInfo = UIView()
            .set(superView: self.view)
            .set(snpClousure: { (make) in
                make.leading.trailing.bottom.equalTo(self.view)
                make.height.equalTo(45);
            })
            .set(layerCornerRadius: 10)
            .set(backgroundColor: UIColor.init(white: 0, alpha: 0.7))
        
        self.lblName = UILabel()
            .set(superView: self.view)
            .set(snpClousure: { (make) in
                make.centerY.equalTo(self.vInfo)
                make.leading.equalTo(self.vInfo.snp.leading).offset(15)
            })
//            .set(title: "Poppy")
            .set(foregroundColor: .white)
            .set(font: UIFont.boldSystemFont(ofSize: 16))
        
        self.btnCast = UIButton()
            .set(superView: self.view)
            .set(snpClousure: { (make) in
                make.centerY.equalTo(self.vInfo)
                make.trailing.equalTo(self.vInfo.snp.trailing).offset(-15)
            })
            .set(img: UIImage.init(named: "ic-other-coin"))
//            .set(title: "  1")
            .set(foregroundColor: .white)
            .set(font: UIFont.boldSystemFont(ofSize: 20))
        
        self.btnTrait0 = UIButton()
            .set(superView: self.view)
            .set(snpClousure: { (make) in
                make.bottom.equalTo(self.vInfo.snp.top).offset(-5)
                make.leading.equalTo(self.vInfo.snp.leading).offset(15)
            })
//            .set(img: UIImage.init(named: "ic-trait-manareaver"))
//            .set(title: "  manareaver")
            .set(foregroundColor: .white)
            .set(font: UIFont.boldSystemFont(ofSize: 20))
            .set(tag: self.tagBase + 0)
        
        self.btnTrait1 = UIButton()
            .set(superView: self.view)
            .set(snpClousure: { (make) in
                make.bottom.equalTo(self.btnTrait0.snp.top).offset(-5)
                make.leading.equalTo(self.vInfo.snp.leading).offset(15)
            })
//            .set(img: UIImage.init(named: "ic-trait-manareaver"))
//            .set(title: "  manareaver")
            .set(foregroundColor: .white)
            .set(font: UIFont.boldSystemFont(ofSize: 20))
            .set(tag: self.tagBase + 1)
        
        self.btnTrait2 = UIButton()
            .set(superView: self.view)
            .set(snpClousure: { (make) in
                make.bottom.equalTo(self.btnTrait1.snp.top).offset(-5)
                make.leading.equalTo(self.vInfo.snp.leading).offset(15)
            })
//            .set(img: UIImage.init(named: "ic-trait-manareaver"))
//            .set(title: "  manareaver")
            .set(foregroundColor: .white)
            .set(font: UIFont.boldSystemFont(ofSize: 20))
            .set(tag: self.tagBase + 2)
        
        self.btnTrait3 = UIButton()
            .set(superView: self.view)
            .set(snpClousure: { (make) in
                make.bottom.equalTo(self.btnTrait2.snp.top).offset(-5)
                make.leading.equalTo(self.vInfo.snp.leading).offset(15)
            })
//            .set(img: UIImage.init(named: "ic-trait-manareaver"))
//            .set(title: "  manareaver")
            .set(foregroundColor: .white)
            .set(font: UIFont.boldSystemFont(ofSize: 20))
            .set(tag: self.tagBase + 3)
        
    }
    
    @discardableResult
    func set(hero: HeroBase) -> Self {
        self.imgBg.set(img: UIImage.init(named: hero.skin))
        self.btnCast.setTitle("  \(hero.cast)", for: .normal)
        self.lblName.set(title: hero.name.uppercasedFirst())
        
        for n in 0..<hero.traits.count {
            let trait = hero.traits[n]
            guard let btn = self.view.viewWithTag(self.tagBase + n) as? UIButton else {
                break
            }
            btn.set(img: UIImage.init(named: "ic-trait-\(trait)"))
               .set(title: "  \(trait.uppercasedFirst())")
        }
        
        return self
    }
    
    func show(during second: TimeInterval?) {
        if self.view == nil {
            self.setMain()
        }
        
        super.show(during: second)
    }
    
    func dismiss() {
        super.dismiss()
    }
    
}


