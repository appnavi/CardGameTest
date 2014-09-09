//
//  CardGameCardSet.swift
//  CardGameTest
//
//  Created by takka on 2014/09/08.
//  Copyright (c) 2014年 takka. All rights reserved.
//

import Foundation

class CardGameCardSet: CardGameObject {
    var cards: [CardGameCard]
    
    init(cards c: [CardGameCard]) {
        self.cards = c
    }
    
    // ADD
    func addCard(card: CardGameCard, toPosition: CardGameCardPosition) {
        switch toPosition {
        case .Top:
            self.cards.append(card)
        case .Bottom:
            self.cards.insert(card, atIndex: 0)
        case .Middle:
            self.cards.insert(card, atIndex: toPosition.getSomePositionIndex(self.cards.count))
        }
    }
    
    // PICK
    func pickCardAtIndex(index: Int) -> CardGameCard? {
        if (self.cards.count == 0) {
            return nil
        }
        
        var i = index
        if (i < 0 || self.cards.count <= i) {
            return nil
        }
        
        var card = self.cards[index]
        self.cards.removeAtIndex(index)
        return card
    }
    
    func pickCardByNumber(number: Int, fromPosition: CardGameCardPosition) -> CardGameCard? {
        switch fromPosition {
        case .Top:
            for var i = 0; i < self.cards.count; i++ {
                var c = self.cards[i]
                if (c.number == number) {
                    var card = c
                    self.cards.removeAtIndex(i)
                    return card
                }
            }
        case .Bottom:
            for var i = self.cards.count - 1; i >= 0; i-- {
                var c = self.cards[i]
                if (c.number == number) {
                    var card = c
                    self.cards.removeAtIndex(i)
                    return card
                }
            }
        case .Middle:
            return nil
        }
        return nil
    }
    
    func pickCardByNumberAndSuit(number: Int, suit: CardGameCardSuit, fromPosition: CardGameCardPosition) -> CardGameCard? {
        switch fromPosition {
        case .Top:
            for var i = 0; i < self.cards.count; i++ {
                var c = self.cards[i]
                if (c.number == number && c.suit == suit) {
                    var card = c
                    self.cards.removeAtIndex(i)
                    return card
                }
            }
        case .Bottom:
            for var i = self.cards.count - 1; i >= 0; i-- {
                var c = self.cards[i]
                if (c.number == number &&  c.suit == suit) {
                    var card = c
                    self.cards.removeAtIndex(i)
                    return card
                }
            }
        case .Middle:
            return nil
        }
        return nil
    }
    
    func pickCardWithCardPosition(position: CardGameCardPosition) -> CardGameCard? {
        switch position {
        case .Top:
            return self.pickCardAtIndex(0)
        case .Bottom:
            return self.pickCardAtIndex(self.cards.count - 1)
        case .Middle:
            return nil
        }
    }
    
    func pickRandomCard() -> CardGameCard {
        var r:Int = Int(arc4random_uniform(UInt32(self.cards.count)))
        var card = self.cards[r]
        self.cards.removeAtIndex(r)
        return card
    }
    
    // OTHER
    func shuffle() {
        var tmp = [CardGameCard]()
        while (self.cards.count > 0) {
            var r = Int(arc4random_uniform(UInt32(self.cards.count)))
            tmp.append(self.cards[r])
            self.cards.removeAtIndex(r)
        }
    }
}

enum CardGameCardPosition {
    case Top, Bottom, Middle
    
    func getSomePositionIndex(maxIndex: Int) -> Int {
        if maxIndex <= 0 {
            return 0
        }
        
        switch self {
        case .Top: return 0
        case .Bottom: return maxIndex - 1
        case .Middle:
            if (maxIndex < 3) {
                return Int(arc4random_uniform(UInt32(2)))
            }
            return Int(arc4random_uniform(UInt32(maxIndex - 2))) + 1
        }
    }
}
