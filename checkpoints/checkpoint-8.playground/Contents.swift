import Cocoa

protocol Building {
    var type: String { get }
    var rooms: Int { get }
    var cost: Int { get set }
    var estateAgent: String { get set }
    
    func salesSummary()
}

extension Building {
    func salesSummary() {
        print("The \(type) has \(rooms) rooms and costs $\(cost). The real estate agent for the property is \(estateAgent).")
    }
}

struct House: Building {
    let type = "house"
    var rooms: Int
    var cost: Int
    var estateAgent: String
}

struct Office: Building {
    let type = "office"
    var rooms: Int
    var cost: Int
    var estateAgent: String
}

let house = House(rooms: 3, cost: 500_000, estateAgent: "John Doe")
house.salesSummary()
let office = Office(rooms: 15, cost: 1_500_000, estateAgent: "Jane Doe")
office.salesSummary()
