//
//  ViewController.swift
//  TFTShow
//
//  Created by Neal on 2020/4/1.
//  Copyright © 2020 Neal. All rights reserved.
//

import UIKit

import RxSwift

import SnapKit

class ViewController: UIViewController {
    
    var hero: HeroBase!
    
    var disposeBag: DisposeBag! {
        set {
            _disposeBag = newValue
        }
        get {
            if _disposeBag == nil {
                _disposeBag = DisposeBag()
            }
            return _disposeBag
        }
    }
    private var _disposeBag: DisposeBag!
    var heroView: HeroTotolView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        self.heroView = HeroView(frame: UIScreen.main.bounds)
//            .set(superView: self.view)
//            .set(snpClousure: { (make) in
////                make.center.equalTo(self.view)
//                make.edges.equalTo(self.view)
//            })
//
//        self.heroView.show(during: 0.2)
        
//
//        self.heroView = HeroTotolView()
//            .set(superView: self.view)
//            .set { (make) in
//                make.leading.equalTo(self.view)
//                make.top.equalTo(self.view)
//            }
        
        HeroSkillView()
            .set(superView: self.view)
            .set { (make) in
                make.center.equalTo(self.view)
            }
            .setMain()
        
        
//        LocalData.load(from: "HeroPlist")
//            .subscribe(onSuccess: { [weak self] (dic) in
//                self?.hero = HeroBase.init(hero: dic["poppy"] as! [String:Any])
//                self?.heroView.set(hero: (self?.hero)!)
//            }) { (err) in
//                print(err)
//            }.disposed(by: self.disposeBag)
//
//
//        PopViewBase().show(during: 0.3)
        
    }


}

