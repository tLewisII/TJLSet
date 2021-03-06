TJLSet
======
A very basic immutable set implementation in Swift.


Usage
------

Initialization
```
let set = Set(array:[1,2,3,4,5,5,4,4,3,3])
let otherSet = Set(items:1,2,3,4,5,5,4,4,3,3)
/// both contain 1,2,3,4,5
```

count, array, any, contains
```
let set = Set(array:[1,2,3,4,5,5,4,4,3,3])

set.count // 5
set.array // [1,2,3,4,5]
set.any() //return any object from the set
set.contains(3) //returns true
```

iteration
```
for item in set {
  someFunc(item)
}
```
union, minus, append

```
let set = Set(array:[1,2,3,4,5,5,4,4,3,3])
let newSet = set.union(Set(items:6,7,8,9))
newSet ∪ Set(items:6,7,8,9) /// same as calling set.union

let minusSet = set - Set(items:1,4,8,9)
let minusSet = set.minus(Set(items:1,4,8,9))

let appendSet = set.append(10)
let appendSet = set += 10

///appendSet contains 1,2,3,4,5,10
///minusSet contains 2,3,5
///newSet contains 1,2,3,4,5,6,7,8,9
```
map and filter
```
let set = Set(array:[1,2,3,4,5,5,4,4,3,3])
let newSet = set.filter{$0 > 2}.map{$0 + $1}

///newSet contains 5,6

```

member and intersect
```
let set = Set(array:[1,2,3,4,5,5,4,4,3,3])
set.member(4) // Some(4)
set.member(457) // Optional.None

set.intersectsSet(Set(items: 7,8,9,10,3)) // true

set.intersect(Set(items: 7,8,9,10,3))
set ∩ Set(items: 7,8,9,10,3) ///Both now contain only 4

```
Other stuff will probably be added soon. Pull Requests welcome.
