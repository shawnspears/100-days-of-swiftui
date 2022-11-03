import Cocoa

let luckyNumbers = [7, 4, 38, 21, 16, 15, 16, 12, 33, 31, 49]
let result = luckyNumbers.filter{ !$0.isMultiple(of: 2) }.sorted().map{ "\($0) is a lucky number" }

for line in result {
    print(line)
}
