import Cocoa

enum SquareRootError: Error {
    case outOfBounds, noRoot
}

func squareRoot(_ num: Int) throws -> Int {
    if num < 1 || num > 10_000 {
        throw SquareRootError.outOfBounds
    }
    
    for i in 1...100 {
        if i * i == num {
            return i
        }
    }
    throw SquareRootError.noRoot
}

print(try squareRoot(25))
