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
append

```
let set = Set(array:[1,2,3,4,5,5,4,4,3,3])
let newSet = set.append(Set(items:6,7,8,9))

///newSet contains 1,2,3,4,5,6,7,8,9
```

Other stuff will probably be added soon. Pull Requests welcome.
