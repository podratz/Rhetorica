//
//  Extensions.swift
//  Rhetorica
//
//  Created by Nick Podratz on 11.07.15.
//  Copyright (c) 2015 Nick Podratz. All rights reserved.
//

import Foundation

extension CollectionType where Index == Int {
    /// Return a copy of `self` with its elements shuffled
    func shuffled() -> [Generator.Element] {
        var list = Array(self)
        list.shuffle()
        return list
    }
}

extension MutableCollectionType where Index == Int {
    /// Shuffle the elements of `self` in-place.
    mutating func shuffle() {
        // empty and single-element collections don't shuffle
        if count < 2 { return }
        
        for i in 0..<count - 1 {
            let j = Int(arc4random_uniform(UInt32(count - i))) + i
            guard i != j else { continue }
            swap(&self[i], &self[j])
        }
    }
}
