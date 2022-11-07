import Cocoa

class Animal {
    var legs: Int
    
    init(legs: Int) {
        self.legs = legs
    }
}

class Dog: Animal {
    func speak() {
        print("Bark!")
    }
}

final class Corgi: Dog {
    override func speak() {
        print("Corgi bark!")
    }
}

final class Poodle: Dog {
    override func speak() {
        print("Poodle bark!")
    }
}

class Cat: Animal {
    var isTame: Bool
    
    init(legs: Int, isTame: Bool) {
        self.isTame = isTame
        super.init(legs: legs)
    }

    func speak() {
        print("Meow!")
    }
}

final class Persian: Cat {
    override func speak() {
        print("Purr")
    }
}

final class Lion: Cat {
    override func speak() {
        print("Roar!")
    }
}
