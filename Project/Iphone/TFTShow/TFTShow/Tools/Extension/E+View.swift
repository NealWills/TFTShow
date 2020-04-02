//
//  E+View.swift
//  TFTShow
//
//  Created by Neal on 2020/4/2.
//  Copyright © 2020 Neal. All rights reserved.
//

import Foundation
import SnapKit

//MARK:- protocol

protocol BaseViewSetProtocol {
    
    /// 设置容器
    /// - Parameter superView: 容器
    @discardableResult
    func set(superView: UIView) -> Self
    
    @discardableResult
    func set(backgroundColor: UIColor?) -> Self
    
    @discardableResult
    func set(layerCornerRadius: CGFloat?, layerMaskToBounds: Bool?) -> Self
    
    @discardableResult
    func set(shadowColor: UIColor?, shadowOffset: CGSize?, shadowRadius: CGFloat?, shadowOpacity: Float?) -> Self
    
}



protocol BaseViewSnpConstraProtocol {
    
    @discardableResult
    func set(snpClousure: (_ make: ConstraintMaker) -> Void) -> Self
    
    @discardableResult
    func reset(snpClousure: (_ make: ConstraintMaker) -> Void) -> Self
    
    @discardableResult
    func update(snpClousure: (_ make: ConstraintMaker) -> Void) -> Self
}

//MARK:- Normal
extension UIView: BaseViewSetProtocol {
    
    @discardableResult
    func set(superView: UIView) -> Self {
        superView.addSubview(self)
        return self
    }
    
    @discardableResult
    func set(backgroundColor: UIColor?=UIColor.clear) -> Self {
        self.backgroundColor = backgroundColor ?? UIColor.clear
        return self
    }
    
    @discardableResult
    func set(layerCornerRadius: CGFloat?=0, layerMaskToBounds: Bool?=false) -> Self {
        self.layer.cornerRadius = layerCornerRadius ?? 0
        self.layer.masksToBounds = layerMaskToBounds ?? false
        return self
    }
    
    @discardableResult
    func set(shadowColor: UIColor?=#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), shadowOffset: CGSize?=CGSize.zero, shadowRadius: CGFloat?=0, shadowOpacity: Float?=0) -> Self {
        self.layer.shadowColor = (shadowColor ?? #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)).cgColor
        self.layer.shadowOffset = shadowOffset ?? .zero
        self.layer.shadowRadius = shadowRadius ?? 0
        self.layer.shadowOpacity = shadowOpacity ?? 0
        return self
    }
    
}

//MARK:- Snapkit
extension UIView {

    @discardableResult
    func set(snpClousure: (_ make: ConstraintMaker) -> Void) -> Self {
        self.snp.makeConstraints(snpClousure)
        return self
    }
    
    @discardableResult
    func reset(snpClousure: (_ make: ConstraintMaker) -> Void) -> Self {
        self.snp.remakeConstraints(snpClousure)
        return self
    }
    
    @discardableResult
    func update(snpClousure: (_ make: ConstraintMaker) -> Void) -> Self {
        self.snp.updateConstraints(snpClousure)
        return self
    }
    
    
}
