# swift-color-detector

CLI to detect and rewrite Swift UIColor  

## A Work In Progress

swift-color-detector is still in active development.   

## Usege

### dump

Sample of Contents.swift  

```swift
import UIKit

let string = "ABCDE"
let color1 = UIColor(red: 0.55, green: 0.0, blue: 0.0, alpha: 1.0)
let array = [1, 2, 3, 4, 5]
let color2 = UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0)
let dictionary = ["foo": 1,
                  "bar": 2,
                  "baz": 3]
let color3 = UIColor.init(red: 0.0, green: 0.0, blue: 1.0, alpha: 1.0) // comment
```

```bash
$ swift run swift-color-detector dump Contents.swift
```

to output

```swift
import UIKit

let string = "ABCDE"
let color1 = UIColor(red: 0.55, green: 0.0, blue: 0.0, alpha: 1.0) /* #8C0000 */ 
let array = [1, 2, 3, 4, 5]
let color2 = UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0) /* #00FF00 */ 
let dictionary = ["foo": 1,
                  "bar": 2,
                  "baz": 3]
let color3 = UIColor.init(red: 0.0, green: 0.0, blue: 1.0, alpha: 1.0)  /* #0000FF */ // commentLine
```

### rewrite

```bash
$ swift run swift-color-detector rewrite Contents.swift
```

Replace Contents.swift to dumped code.  

### help

```bash
$ swift run swift-color-detector help

dump \(path): Dump code
rewrite \(path): Add HexColor Comments and Save
```

## Author

[Yutaro Muta](https://github.com/yutailang0119)
- muta.yutaro@gmail.com
- [@yutailang0119](https://twitter.com/yutailang0119)

## License

ProgressSpinnerKit is available under the MIT license. See [the LICENSE file](./LICENSE) for more info.  
This software includes the work that is distributed in the Apache License 2.0.  
