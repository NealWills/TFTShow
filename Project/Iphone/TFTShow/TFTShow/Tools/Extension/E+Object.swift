//
//  E+Object.swift
//  TFTShow
//
//  Created by Neal on 2020/4/1.
//  Copyright © 2020 Neal. All rights reserved.
//

import Foundation

protocol ObjectShowInfoProtocol { }

extension NSObject: ObjectShowInfoProtocol { }

extension ObjectShowInfoProtocol where Self: NSObject {
    func detailDescribe() {
        
        let arrPro = get_class_copyPropertyList()
        print("==========================")
        arrPro.forEach { (key) in
            print("  ", key)
        }
        print("==========================")
        print("")
        
    }
    
    func get_class_copyPropertyList()->[String]{
        var outCount:UInt32 = 0
        let propers:UnsafeMutablePointer<objc_property_t>! =  class_copyPropertyList(self.classForCoder, &outCount)
        let count:Int = Int(outCount);
        var names:[String] = [String]()
        for i in 0...(count-1) {
            let aPro: objc_property_t = propers[i]
            if let proName:String = String(utf8String: property_getName(aPro)){
                names.append(proName)
            }
        }
        return names
    }
}

