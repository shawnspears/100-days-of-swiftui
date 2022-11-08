import Cocoa

func randomInt(in arr: [Int]?) -> Int {
    arr?.randomElement() ?? Int.random(in: 1...100)
}

let test: [Int] = []
print(randomInt(in: test))
