//
//  E+Pop.swift
//  TFTShow
//
//  Created by Neal on 2020/4/3.
//  Copyright © 2020 Neal. All rights reserved.
//

import Foundation

import UIKit

protocol PopBaseProtocol {
    func show(during second:TimeInterval?)
    func dismiss()
    func setMain()
}

//Bottom
fileprivate extension PopBaseProtocol {
    func showBase() {}
    func dismissBase() {}
    func setMainBase() {}
}

class PopViewBase: UIView {
    var btnM: UIButton!
    var view: UIView!
    var animationTime: TimeInterval!
    var isShow: Bool?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setMainBase()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PopViewBase: PopBaseProtocol {}

extension PopBaseProtocol where Self: PopViewBase {
    func setMain() { }
    
    func show(during second: TimeInterval?) {
        self.animationTime = second
        self.showBase()
    }
    
    func dismiss() {
        self.dismissBase()
    }
}


fileprivate extension PopBaseProtocol where Self: PopViewBase {
    
    func showBase() {
        self.isUserInteractionEnabled = false
        self.isHidden = true
        UIView.animate(withDuration: self.animationTime, animations: {
            self.alpha = 1.0
        }) { [weak self] (_) in
            self?.isUserInteractionEnabled = true
        }
    }
    
    func dismissBase() {
        self.isUserInteractionEnabled = false
        UIView.animate(withDuration: self.animationTime, animations: {
            self.alpha = 0.0
        }) { [weak self] (_) in
            self?.isUserInteractionEnabled = true
            self?.isHidden = true
        }
    }
    
    func setMainBase() {
        self.btnM = UIButton()
            .set(superView: self)
            .set(backgroundColor: UIColor.init(white: 0, alpha: 0.2))
            .set(snpClousure: { (make) in
                make.edges.equalTo(self)
            })
    }
    
}

