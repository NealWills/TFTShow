//
//  DataLoadModule.swift
//  TFTShow
//
//  Created by Neal on 2020/4/1.
//  Copyright © 2020 Neal. All rights reserved.
//

import Foundation

import RxSwift

struct LocalData {
    
    static func load(from plist: String) -> Single<[String:Any]> {
        
        return Single<[String:Any]>.create { single in
                        
            guard let plistPath = Bundle.main.path(forResource: plist, ofType: "plist") else {
                single(.error(LocalDataLoadError.fileNotAnalyze))
                return Disposables.create { }
            }

            guard let data = NSDictionary.init(contentsOfFile: plistPath) else {
                single(.error(LocalDataLoadError.fileNotAnalyze))
                return Disposables.create { }
            }
            
            guard let dic = data as? [String:Any] else {
                single(.error(LocalDataLoadError.typeNotChanged))
                return Disposables.create { }
            }

            single(.success(dic))

            
            return Disposables.create { }
            
        }
        
    }
}



enum LocalDataLoadError: Error {
    case fileNotFound
    case fileNotAnalyze
    case typeNotChanged
}
