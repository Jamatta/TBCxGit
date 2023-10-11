class SuperEnemy {
    var name: String
    var hitPoint: Int
    
    init(name: String, hitPoint: Int) {
        self.name = name
        self.hitPoint = hitPoint
    }
}

protocol Superhero {
    var name: String { get }
    var alias: String { get }
    var isEvil: Bool { get }
    var isAlive: Bool { get set }
    var superPowers: [String: Int] { get set }
    
    func attack(target: SuperEnemy) -> Int
    mutating func performSuperPower(target: SuperEnemy) -> Int
}

extension Superhero {
    func attack(target: SuperEnemy) -> Int {
        if target.hitPoint <= 0 {
            print("☠️ Mokvta! Mokvta!")
            return 0
        } else {
            let autoAttackDamage = Int.random(in: 20...40)
            target.hitPoint -= autoAttackDamage
            print("\(name) deal DMG 💥 - \(autoAttackDamage)")
            print("\(target.name)'s left HP ♥️ - \(target.hitPoint)")
            return autoAttackDamage
        }
    }
    
    mutating func performSuperPower(target: SuperEnemy) -> Int {
        if target.hitPoint <= 0 {
            print("☠️ Mokvda! Mokvda!")
            return target.hitPoint
        } else if superPowers.isEmpty {
            print("❌ \(name) has no left any Super Power and has fallen!")
            isAlive = false
            return 0
        } else {
            let power = superPowers.randomElement()!
            let damage = power.value
            print("\(power.key) is active. Power DMG 💥 - \(damage)")
            superPowers.removeValue(forKey: power.key)
            target.hitPoint -= damage
            print("\(target.name) heal is - \(target.hitPoint)")
            print("superPowers \(superPowers)")
            return damage
        }
    }
}

struct Komble: Superhero {
    var name = "🏒 Komble"
    var alias = "Association of Georgian storytellers"
    var isEvil = false
    var isAlive = true
    var superPowers: [String: Int] = [
        "Crook Whack": 25,
        "Flaming Crook Blaze": 35,
        "Sheep Stampede Fury": 60
    ]
}

struct Wikara: Superhero {
    var name = "🐂 Wikara"
    var alias = "Association of Georgian storytellers"
    var isEvil = false
    var isAlive = true
    var superPowers: [String: Int] = [
        "Skull Crusher": 15,
        "Raging Bull": 40,
        "Shadowwood Charger": 80
    ]
}

struct Nacarqeqia: Superhero {
    var name = "🧑🏽‍🦯 Nacarqeqia"
    var alias = "Association of Georgian storytellers"
    var isEvil = false
    var isAlive = true
    var superPowers: [String: Int] = [
        "Ashen Blinder": 20,
        "Shadow Leaper": 45,
        "Fat Needle Piercer": 70
    ]
}

struct Luarsabi: Superhero {
    var name = "👴🏼 Luarsabi"
    var alias = "Association of Georgian storytellers"
    var isEvil = false
    var isAlive = true
    var superPowers: [String: Int] = [
        "Bulging Belly Bash": 30,
        "Bean Blast": 45,
        "Darejani's Wrath": 85
    ]
}

class SuperSquad {
    var superheroes: [Superhero]
    init(superheroes: [Superhero]) {
        self.superheroes = superheroes
    }
    
    func printSquadMembers() {
        for member in superheroes {
            print("\(member.name) - \(member.alias)")
        }
    }
}

func simulateShowdown(squad: SuperSquad, enemy: SuperEnemy) {
    while enemy.hitPoint > 0 {
        for i in 0..<squad.superheroes.count {
            print("------ Round 👯‍♀️ #\(i + 1) -----")
            var hero = squad.superheroes[i]
            if hero.isAlive {
                if !hero.superPowers.isEmpty {
                    _ = hero.performSuperPower(target: enemy)
                    if enemy.hitPoint <= 0 {
                        print("☠️ Mokvda! Mokvda!")
                        return
                    }
                } else {
                    _ = hero.attack(target: enemy)
                    hero.isAlive = false
                    squad.superheroes.remove(at: i)
                    print("\(i + 1) - hero is dead")
                    if enemy.hitPoint <= 0 {
                        print("☠️ Mokvda! Mokvda!")
                        return
                    } else {
                        print("ბოროტებამ გაიმარჯვა 😈")
                        return
                    }
                }
            }
            squad.superheroes[i] = hero
        }
    }
}

var komble = Komble()
var wikara = Wikara()
var nacarqeqia = Nacarqeqia()
var luarsabi = Luarsabi()

var bidzina = SuperEnemy(name: "Bidzina", hitPoint: 500)
var squad = SuperSquad(superheroes: [komble, wikara, nacarqeqia, luarsabi])
squad.printSquadMembers()

simulateShowdown(squad: squad, enemy: bidzina)
