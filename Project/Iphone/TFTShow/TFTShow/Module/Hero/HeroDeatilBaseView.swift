//
//  HeroDeatilBaseView.swift
//  TFTShow
//
//  Created by Neal on 2020/4/6.
//  Copyright © 2020 Neal. All rights reserved.
//

import Foundation

import UIKit

protocol HeroDetailProtocol { }

class HeroDeatilBaseView: UIView {
    
    fileprivate var baseMainView: UIView!
    
    var imgBg: UIImageView!
    var imgM: UIButton!
    
    var lblTitle: UILabel!
    
    var vLine: UIView!
    
    var view: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setMainBase()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension HeroDeatilBaseView: HeroDetailProtocol {}

extension HeroDetailProtocol where Self: HeroDeatilBaseView {
    
    
    func setMainBase() {
        self.baseMainView = UIView()
            .set(superView: self)
            .set(snpClousure: { (make) in
                make.top.equalTo(self.snp.top)
                make.bottom.equalTo(self.snp.bottom)
                make.leading.equalTo(self.snp.leading)
                make.trailing.equalTo(self.snp.trailing)
            })
            .set(layerCornerRadius: 10, layerMaskToBounds: true)
        
        self.imgBg = UIImageView()
            .set(superView: self.baseMainView)
            .set(snpClousure: { [weak self] (make) in
                make.top.equalTo(self!.baseMainView.snp.top)
                make.bottom.equalTo(self!.baseMainView.snp.bottom)
                make.leading.equalTo(self!.baseMainView.snp.leading)
                make.trailing.equalTo(self!.baseMainView.snp.trailing)
            })
            .set(viewMode: .scaleAspectFill)
            
        
        self.imgM = UIButton()
            .set(superView: self.baseMainView)
            .set(snpClousure: { [weak self] (make) in
                make.edges.equalTo((self?.baseMainView)!)
            })
            .set(backgroundColor: UIColor.init(white: 0, alpha: 0.15))
        
        self.lblTitle = UILabel()
            .set(superView: self.baseMainView)
            .set(snpClousure: { (make) in
                make.leading.equalTo(self.baseMainView.snp.leading).offset(15)
                make.trailing.equalTo(self.baseMainView.snp.trailing).offset((-15))
                make.top.equalTo(self.baseMainView.snp.top)
                make.height.equalTo(35)
            })
            .set(foregroundColor: .white)
            .set(font: UIFont.systemFont(ofSize: 16))
        
        self.view = UIView()
            .set(superView: self.baseMainView)
            .set(snpClousure: { (make) in
                make.leading.trailing.bottom.equalTo(self.baseMainView)
                make.top.equalTo(self.lblTitle.snp.bottom)
            })
        
        self.vLine = UIView()
            .set(superView: self.baseMainView)
            .set(snpClousure: { (make) in
                make.leading.equalTo(self.baseMainView.snp.leading)
                make.trailing.equalTo(self.baseMainView.snp.trailing)
                make.height.equalTo(0.5)
                make.top.equalTo(self.lblTitle.snp.bottom)
            })
            .set(backgroundColor: .init(white: 1, alpha: 0.2))
        
    }
    
    @discardableResult
    func set(title: String) -> Self {
        self.lblTitle.text = title
        return self
    }
    
}
