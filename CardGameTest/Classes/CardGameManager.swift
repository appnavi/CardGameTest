//
//  CardGameManager.swift
//  CardGameTest
//
//  Created by takka on 2014/09/08.
//  Copyright (c) 2014年 takka. All rights reserved.
//

import Foundation

class CardGameManager : CardGameObject {
    var players: [CardGamePlayer]
    
    init(players p: [CardGamePlayer]) {
        self.players = p
    }

}