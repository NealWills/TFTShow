//
//  HeroTotolView.swift
//  TFTShow
//
//  Created by Neal on 2020/4/5.
//  Copyright © 2020 Neal. All rights reserved.
//

import Foundation
import UIKit

protocol HeroTotolProtocol { }

class HeroTotolView: UIView {
    
    var view: UIView!
    
    var imgBg : UIImageView!
    var imgM: UIButton!
    var vInfo: UIView!
    var lblName: UILabel!
    var btnCast: UIButton!
    var btnTrait0: UIButton!
    var btnTrait1: UIButton!
    var btnTrait2: UIButton!
    var btnTrait3: UIButton!
    
    let tagBase = 700100
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setMainBase()
        self.setMain()
    }
    
    func setMainBase() {
        self.view = UIView()
            .set(superView: self)
            .set(snpClousure: { (make) in
                make.top.equalTo(self.snp.top)
                make.bottom.equalTo(self.snp.bottom)
                make.leading.equalTo(self.snp.leading)
                make.trailing.equalTo(self.snp.trailing)
            })
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HeroTotolView: HeroTotolProtocol {}

extension HeroTotolProtocol where Self: HeroTotolView {
    func setMain() {

        self.imgBg = UIImageView()
            .set(superView: self.view)
            .set(snpClousure: { [weak self] (make) in
                make.top.equalTo(self!.view.snp.top)
                make.bottom.equalTo(self!.view.snp.bottom)
                make.leading.equalTo(self!.view.snp.leading)
                make.trailing.equalTo(self!.view.snp.trailing)
                make.center.equalTo(self!.view.snp.center)
                make.width.equalTo(300)
                make.height.equalTo(200)
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
    
}
