// Playground - noun: a place where people can play

import Cocoa

struct Set<A: Hashable> : Sequence {
    var bucket:Dictionary<A, Bool> = Dictionary()
    
    var array:Array<A> {
    get {
        var ar = Array<A>()
        for (key, _) in bucket {
            ar += key
        }
        return ar
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
    
    
    func append(set:Set<A>) -> Set<A> {
        var current = self.array
        current += set.array
        return Set(array: current)
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

let set = Set(array: [1,2,3,4,5,5,4,4,5,5])
let otherSet = Set(items: 6,7,8,9,10,10,1000,5600)
set.array

set.any()
set.contains(5)

for x in set {
    x
}

let newSet = set.append(otherSet)
newSet.array
