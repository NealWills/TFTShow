//
//  E+String.swift
//  TFTShow
//
//  Created by Neal on 2020/4/5.
//  Copyright © 2020 Neal. All rights reserved.
//

import Foundation


protocol StringExtensionProtocol { }

extension String: StringExtensionProtocol { }

extension StringExtensionProtocol where Self == String {
    
    
    func uppercasedFirst() -> String {
        var first = ""
        if self.count > 0 {
            first = self[0..<1].uppercased()
        }
        var others = ""
        if self.count >= 1 {
            others = self[1..<self.count].lowercased()
        }
        return first + others
    }
    
    
    subscript(_ range: Range<Int>) -> String {
        let sub1 = self.prefix(range.endIndex)
        let str1 = String.init(sub1)
        let sub2 = str1.suffix(range.endIndex - range.startIndex)
        
        return String.init(sub2)
    }
}


