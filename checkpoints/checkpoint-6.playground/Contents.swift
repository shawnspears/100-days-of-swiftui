import Cocoa

enum gearError: Error {
    case invalidGear
}

struct Car {
    let model: String
    let numSeats: Int
    var currGear: Int = 0
    
    mutating func changeGear(newGear: Int) throws -> Bool {
        if newGear < 1 || newGear > 10 {
            throw gearError.invalidGear
        }
        currGear = newGear
        return true
    }
}

var car = Car(model: "Toyota Corolla", numSeats: 5)
do {
    try car.changeGear(newGear: 3)
} catch {
    print("An invalid gear was selected")
}
print(car.currGear)
