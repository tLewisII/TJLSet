//
//  Set.swift
//  TJLSet
//
//  Created by Terry Lewis II on 6/5/14.
//  Copyright (c) 2014 Blue Plover Productions LLC. All rights reserved.
//

import Foundation

struct Set<A: Hashable> : Sequence {
    var bucket:Dictionary<A, Bool> = Dictionary()
    
    var array:Array<A> {
    get {
        var arr = Array<A>()
        for (key, _) in bucket {
            arr += key
        }
        return arr
    }
    }
    
    var count:Int {
    get {
        return bucket.count
    }
    }
    
    init(items:A...) {
        self.init(array:items)
    }
    
    init(array:Array<A>) {
        for obj in array {
            bucket[obj] = true
        }
    }
    
    func any() -> A {
        let ar = self.array
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
    
    func member(item:A) -> A? {
        if self.contains(item) {
            return Optional.Some(item)
        } else {
            return nil
        }
    }
    
    func interectsSet(set:Set<A>) -> Bool {
        for x in set {
            if self.contains(x) {
                return true
            }
        }
        return false
    }
    
    func append(set:Set<A>) -> Set<A> {
        var current = self.array
        current += set.array
        return Set(array: current)
    }
    
    func filter(f:(A -> Bool)) -> Set<A> {
        var array = Array<A>()
        for x in self {
            if f(x) {
                array += x
            }
        }
        return Set(array: array)
    }
    
    func map<B>(f:(A -> B)) -> Set<B> {
        var array:Array<B> = Array()
        for x in self {
            array += f(x)
        }
        
        return Set<B>(array: array)
    }
    
    func generate() -> SetGenerator<A>  {
        let items = self.array
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