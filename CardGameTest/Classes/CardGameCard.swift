//
//  CardGameCard.swift
//  CardGameTest
//
//  Created by takka on 2014/09/08.
//  Copyright (c) 2014年 takka. All rights reserved.
//

import Foundation

class CardGameCard : CardGameObject {
    var suit: CardGameCardSuit
    var number: Int {
        didSet {
            if (self.suit == .Joker) {
                self.number = 0
            }
        }
    }
    
    init(suit s: CardGameCardSuit, number n: Int) {
        self.number = n
        self.suit = s
    }
}

enum CardGameCardSuit: Int {
    case Joker = 0, Spade, Heart, Diamond, Club
    
    func toString() -> String {
        switch self {
        case .Joker : return "JOKER"
        case .Spade : return "♠"
        case .Heart : return "♥"
        case .Diamond : return "♦"
        case .Club : return "♣"
        }
    }
    
}