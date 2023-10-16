import Foundation

class PirateShip: Cannons {
    private let name: String
    private var cannonsCount: Int
    private let crewManager: CrewManaging
    private let cargoManager: CargoManaging
    
    init(name: String, cannonsCount: Int, crewManager: CrewManaging, cargoManager: CargoManaging) {
        self.name = name
        self.cannonsCount = cannonsCount
        self.crewManager = crewManager
        self.cargoManager = cargoManager
    }
    
    func addCrew(member: String) {
        crewManager.addCrew(member: member)
    }
    
    func removeCrew(member: String) {
        crewManager.removeCrew(member: member)
    }
    
    func listCrew() {
        crewManager.listCrew()
    }
    
    func addCargo(item: String) {
        cargoManager.addCardo(item: item)
    }
    
    func removeCargo(item: String) {
        cargoManager.removeCargo(item: item)
    }
    
    func listCargo() {
        cargoManager.listCargo()
    }
    
    func cannonCount(){}
    func firingCannons(count: Int){}
}

protocol CrewManaging {
    func addCrew(member: String)
    func removeCrew(member: String)
    func listCrew()
}

protocol CargoManaging {
    func addCardo(item: String)
    func removeCargo(item: String)
    func listCargo()
}

protocol Cannons {
    func cannonCount()
    func firingCannons(count: Int)
}

class CrewManager: CrewManaging {
    private var crew: [String]
    
    init(crew: [String]) {
        self.crew = crew
    }
    
    func addCrew(member: String) {
        crew.append(member)
        print("👲🏼 Added \(member) to crew")
    }
    
    func removeCrew(member: String) {
        if let index = crew.firstIndex(of: member) {
            crew.remove(at: index)
            print("😭 Removed \(member) from the crew")
        } else {
            print("👀 Member \(member) is not found in the crew")
        }
    }
    
    func listCrew() {
        print(crew)
    }
}

class CargoManager: CargoManaging {
    private var cargo: [String]
    
    init(cargo: [String]) {
        self.cargo = cargo
    }
    
    func addCardo(item: String) {
        cargo.append(item)
        print("➕ Added \(item) to cargo")
    }
    
    func removeCargo(item: String) {
        if let index = cargo.firstIndex(of: item) {
            cargo.remove(at: index)
            print("🗑️ Removed \(item) from the cargo")
        } else {
            print("👀 Item \(item) is not found in the cargo")
        }
    }
    
    func listCargo() {
        print(cargo)
    }
    
}

class Frigate: PirateShip {
    private let supportMember: String
    private let shipColor: String = "Grey"
    private var submarineCount: Int = 2
    
    init(supportMember: String, shipColor: String, submarineCount: Int, name: String, cannonsCount: Int, crewManager: CrewManaging, cargoManager: CargoManaging) {
        self.supportMember = supportMember
        super.init(name: name, cannonsCount: cannonsCount, crewManager: crewManager, cargoManager: cargoManager)
    }
    
    func motivateCrew() {
        if supportMember == "Nino" {
            print("🎶 წითელი მზე, შავი ზღვა და ზღვაზე თეთრი აფრები 🎶🎶")
        }
    }
    
    func releaseSubmarine(subs: Int) {
        switch  submarineCount {
        case let count where count >= subs:
            submarineCount -= subs
            print("Released \(subs) submarines. Remaining submarines: \(submarineCount)")
        default:
            print("Not enough submarines")
        }
    }
}

class Galleon: PirateShip {
    private let supportMember: String
    
    init(supportMember: String, name: String, cannonsCount: Int, crewManager: CrewManaging, cargoManager: CargoManaging) {
        self.supportMember = supportMember
        super.init(name: name, cannonsCount: cannonsCount, crewManager: crewManager, cargoManager: cargoManager)
    }
    
    func motivateCrew() {
        if supportMember == "Jack Sparrow" {
            print("Unflurl the sails!")
        } else {
            print("There is not a Motivator member")
        }
    }
}

class TreasureMap {
    private let coorX: Int
    private let coorY: Int
    
    init(coorX: Int, coorY: Int) {
        self.coorX = coorX
        self.coorY = coorY
    }
    
    func hintToTreasure(inputX: Int, inputY: Int) {
        var x = inputX
        var y = inputY
        
        while x != coorX {
            if x < coorX {
                x += 1
                print("Go west")
            } else {
                x -= 1
                print("Go east")
            }
        }
        while y != coorY {
            if y < coorY {
                y += 1
                print("Go north")
            } else {
                y -= 1
                print("Go south")
            }
        }
        if x == coorX && y == coorY {
            print("🥳 იგლოცავ ბიძი ⚱️🏅👑⚜️ საგანძური შენია!")
        }
    }
}

class SeaAdventure {
    let adventureType: String
    
    init(advantureType: String) {
        self.adventureType = advantureType
    }
    
    func encounter() {
        print("advanture type is - \(adventureType)")
    }
}

class PirateCode {
    private func discussTerms(term: String) {
        print(term)
    }
    func parley() {
        print("Parley is already started")
        discussTerms(term: "Open fire!")
    }
    
    func mutiny() {
        print("Wait, lets talk")
        discussTerms(term: "Open fire!")
    }
}

let blackCrew = CrewManager(crew: ["Jack", "Bill", "Ashot"])
let whiskeyGallon = CargoManager(cargo: ["Whiskey"])
let blackPearl = PirateShip(name: "Black Pearl", cannonsCount: 40, crewManager: blackCrew, cargoManager: whiskeyGallon)
let rcheuliBichebi = ["Jotia", "Egnate", "Astama", "Levani botia", "Radradra", "Tuisova", "Okocha"]
for members in rcheuliBichebi {
    blackPearl.addCrew(member: members)
}

blackPearl.addCargo(item: "Swords")
blackPearl.addCargo(item: "Guns")
blackPearl.addCargo(item: "Food")
let map = TreasureMap(coorX: 12, coorY: 21)
let codex = PirateCode()
let seaAdvanture = SeaAdventure(advantureType: "🏴‍☠️ Meet with Flying Dutchman")
map.hintToTreasure(inputX: 10, inputY: 10)
seaAdvanture.encounter()
codex.mutiny()
