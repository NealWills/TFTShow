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
    var heroView: HeroView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.heroView = HeroView()
        self.view.addSubview(self.heroView)
        self.heroView.snp.makeConstraints { (make) in
            make.center.equalTo(self.view)
        }
        
        LocalData.load(from: "HeroPlist")
            .subscribe(onSuccess: { [weak self] (dic) in
                self?.hero = HeroBase.init(hero: dic["bobi"] as! [String:Any])
                print(self!.hero.description)
            }) { (err) in
                print(err)
            }.disposed(by: self.disposeBag)
    }


}

