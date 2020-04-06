//
//  HeroModule.swift
//  TFTShow
//
//  Created by Neal on 2020/4/1.
//  Copyright © 2020 Neal. All rights reserved.
//

import Foundation

class HeroBase :NSObject {
    
    /// 头像
    var avatar: String
    
    /// 皮肤
    var skin: String
    
    /// 费用
    var cast: Int
    
    /// 羁绊效果
    var traits: [String]
    
    /// 英雄名字
    var name: String
    
    /// 英雄技能 .0 技能名称 .1 技能描述
    var skill: (String, String)
    
    /// 护甲
    var armor: (Int, Int, Int)
    
    /// 攻击
    var attack: (Int, Int, Int)
    
    /// 攻击距离
    var attackDistance: (Int, Int, Int)
    
    /// 攻击速度
    var attackSpeed: (Double, Double, Double)
    
    /// 暴击率
    var critical: (Double, Double, Double)
    
    /// 血上限
    var hp: (Int, Int, Int)
    
    /// 初始蓝量
    var mpFirst: (Int, Int, Int)
    
    /// 最大蓝量
    var mpMax: (Int, Int, Int)
    
    /// 魔抗
    var resistance: (Int, Int, Int)
    
    
    init(hero dic: [String:Any]) {
        
        self.cast = dic["cast"] as? Int ?? 99999
        self.traits = dic["traits"] as? [String] ?? []
        self.name = dic["name"] as? String ?? ""
        self.avatar = dic["avatar"] as? String ?? ""
        self.skin = dic["skin"] as? String ?? ""
        
        let dicSkill = dic["skill"] as? [String:Any] ?? [:]
        self.skill = (dicSkill["name"] as? String ?? "", dicSkill["describe"] as? String ?? "")
        
        let arrStar = dic["star"] as? [[String:Any]] ?? []
        
        self.armor = (arrStar[0]["armor"] as? Int ?? 0, arrStar[1]["armor"] as? Int ?? 0, arrStar[2]["armor"] as? Int ?? 0)
        self.attack = (arrStar[0]["attack"] as? Int ?? 0, arrStar[1]["attack"] as? Int ?? 0, arrStar[2]["attack"] as? Int ?? 0)
        self.attackDistance = (arrStar[0]["attackDistance"] as? Int ?? 0, arrStar[1]["attackDistance"] as? Int ?? 0, arrStar[2]["attackDistance"] as? Int ?? 0)
        self.attackSpeed = (arrStar[0]["attackSpeed"] as? Double ?? 0, arrStar[1]["attackSpeed"] as? Double ?? 0, arrStar[2]["attackSpeed"] as? Double ?? 0)
        self.critical = (arrStar[0]["critical"] as? Double ?? 0, arrStar[1]["critical"] as? Double ?? 0, arrStar[2]["critical"] as? Double ?? 0)
        self.hp = (arrStar[0]["hp"] as? Int ?? 0, arrStar[1]["hp"] as? Int ?? 0, arrStar[2]["hp"] as? Int ?? 0)
        self.mpFirst = (arrStar[0]["mpFirst"] as? Int ?? 0, arrStar[1]["mpFirst"] as? Int ?? 0, arrStar[2]["mpFirst"] as? Int ?? 0)
        self.mpMax = (arrStar[0]["mpMax"] as? Int ?? 0, arrStar[1]["mpMax"] as? Int ?? 0, arrStar[2]["mpMax"] as? Int ?? 0)
        self.resistance = (arrStar[0]["resistance"] as? Int ?? 0, arrStar[1]["resistance"] as? Int ?? 0, arrStar[2]["resistance"] as? Int ?? 0)
        
        
    }
    
    
    override var description: String {
        get {
            print("===========================")
            print(" ", "cast", ":", self.cast)
            print(" ", "character", ":", self.traits)
            print(" ", "name", ":", self.name)
            print(" ", "skill", ":", self.skill)
            print(" ", "armor", ":", self.armor)
            print(" ", "attack", ":", self.attack)
            print(" ", "attackDistance", ":", self.attackDistance)
            print(" ", "attackSpeed", ":", self.attackSpeed)
            print(" ", "critical", ":", self.critical)
            print(" ", "hp", ":", self.hp)
            print(" ", "mpFirst", ":", self.mpFirst)
            print(" ", "mpMax", ":", self.mpMax)
            print(" ", "resistance", ":", self.resistance)
            print("===========================")
            return ""
        }
    }
    
}

