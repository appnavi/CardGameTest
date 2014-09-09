//
//  CardGamePlayer.swift
//  CardGameTest
//
//  Created by takka on 2014/09/08.
//  Copyright (c) 2014年 takka. All rights reserved.
//

import Foundation

class CardGamePlayer : CardGameObject {
    var talon: [CardGameCard]
    var point = 0
    
    var hand = [CardGameCard]()
    
    init (talon c: [CardGameCard]) {
        self.talon = c
    }
}