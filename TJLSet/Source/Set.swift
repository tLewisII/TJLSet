//
//  Set.swift
//  TJLSet
//
//  Created by Terry Lewis II on 6/5/14.
//  Copyright (c) 2014 Blue Plover Productions LLC. All rights reserved.
//

import Foundation

struct Set<A: Hashable> :Sequence {
    var bucket:Dictionary<A, Bool> = Dictionary()
    
    init(items:A...) {
        self.init(array:items)
    }
    
    init(array:Array<A>) {
        for obj in array {
            bucket[obj] = true
        }
    }
    
    func array() -> Array<A> {
        var ar = Array<A>()
        for (key, _) in bucket {
            ar += key
        }
        return ar
    }
    
    func any() -> A {
        let ar = self.array()
        let index = Int(arc4random_uniform(UInt32(ar.count)))
        return ar[index]
    }
    
    func contains(item:A) -> Bool {
        if let c = bucket[item] {
            return c
        } else {
            return false
        }
    }
    
    func count() -> Int {
        return bucket.count
    }
    
    func generate() -> SetGenerator<A>  {
        let items = self.array()
        return SetGenerator(items: items[0..items.count])
    }
}


struct SetGenerator<A> : Generator {
    mutating func next() -> A?  {
        if items.isEmpty { return nil }
        let ret = items[0]
        items = items[1..items.count]
        return ret
    }
    
    var items:Slice<A>
    
}
func ==<A: Equatable, B: Equatable>(lhs:Set<A>, rhs:Set<B>) -> Bool {
    return lhs.bucket == rhs.bucket
}

func !=<A: Equatable, B: Equatable>(lhs:Set<A>, rhs:Set<B>) -> Bool {
    return lhs.bucket != rhs.bucket
}