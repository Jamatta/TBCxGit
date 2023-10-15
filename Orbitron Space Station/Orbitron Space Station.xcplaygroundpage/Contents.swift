class StationModule {
    private(set) var moduleName: String
    var drone: Drone?
    
    init(moduleName: String, drone: Drone?) {
        self.moduleName = moduleName
        self.drone = drone
    }
}

class ControlCenter: StationModule {
    var isLockedDown: Bool
    private var securityCode: String
    
    init(isLockedDown: Bool, securityCode: String, moduleName: String, drone: Drone?) {
        self.isLockedDown = isLockedDown
        self.securityCode = securityCode
        super.init(moduleName: moduleName, drone: nil)
    }
    
    func lockdown(password: String) {
        if password == securityCode {
            print("⚠️ LOCKDOWN!")
            isLockedDown = true
        } else {
            print("Security code is incorrect ❌")
        }
    }
    
    func connection(accesToken: String) -> Bool {
        if accesToken == securityCode {
            print("✅ Connection to Station")
            return true
        } else {
            print("❌ Passcode is incorrect")
        }
        return false
    }
    
    func isCCOnLockdown() {
        if isLockedDown {
            print("Control Center is ⚠️ on lockdown.")
        } else {
            print("Control Center is ❇️ not on lockdown.")
        }
    }
}

class ResearchLab: StationModule {
    private var labArray: [String]
    
    init(labArray: [String], moduleName: String, drone: Drone?) {
        self.labArray = labArray
        super.init(moduleName: moduleName, drone: nil)
    }
    
    func addElementsInArray(element: [String]) {
        labArray.append(contentsOf: element)
    }
}

class LifeSupportSystem: StationModule {
    private var oxygenLevel: Int
    
    init(oxygenLevel: Int, moduleName: String, drone: Drone?) {
        self.oxygenLevel = oxygenLevel
        super.init(moduleName: moduleName, drone: nil)
    }
    
    func oxygenStatus() {
        if oxygenLevel >= 50 {
            print("🔋 Oxygen level in Station is OK - \(oxygenLevel)")
        } else {
            print("🪫 Oxygen level in Station is Critical - \(oxygenLevel)")
            
        }
    }
}

class Drone {
    var task: String?
    unowned var assignedModule: StationModule
    weak var missionControlLink: MissionControl?
    
    init(task: String?, assignedModule: StationModule, missionControlLink: MissionControl?) {
        self.task = task
        self.assignedModule = assignedModule
        self.missionControlLink = missionControlLink
    }
    
    func hasDroneTask() {
        if task == nil {
            print("🚁 Drone has not any Task")
        } else {
            print("🚁 Drone's Task is - \(task ?? "walking around")")
        }
    }
}

class OrbitronSpaceStation {
    let controlCenter = ControlCenter(isLockedDown: false, securityCode: "Qwerty", moduleName: "Module CC", drone: nil)
    let researchLab = ResearchLab(labArray: ["Element1, Element2, Element3"], moduleName: "Module Lab", drone: nil)
    let lifeSupportSystem = LifeSupportSystem(oxygenLevel: 73, moduleName: "Module LSS", drone: nil)
    
    init() {
        let droneBB8 = Drone(task: "Task1", assignedModule: controlCenter, missionControlLink: nil)
        let droneBB9 = Drone(task: "Task2", assignedModule: researchLab, missionControlLink: nil)
        let droneBB10 = Drone(task: "Task3", assignedModule: lifeSupportSystem, missionControlLink: nil)
        
        controlCenter.drone = droneBB8
        researchLab.drone = droneBB9
        lifeSupportSystem.drone = droneBB10
    }
    
    func ccLocker(password: String){
        controlCenter.lockdown(password: password)
    }
    
    func isLocked() {
        controlCenter.isCCOnLockdown()
    }
}

class MissionControl {
    var spaceStation: OrbitronSpaceStation?
    var isConnected: Bool = false
    
    func conncectWithOSS(station: OrbitronSpaceStation, accesToken: String) {
        if  station.controlCenter.connection(accesToken: accesToken) == true {
            isConnected = true
        }
    }
    
    func requestControlCenterStatus(station: OrbitronSpaceStation) {
        if isConnected {
            station.isLocked()
        } else {
            print("🚫 Access Denied")
        }
    }
    
    func requestOxygenStatus(station: OrbitronSpaceStation) {
        if isConnected {
            station.lifeSupportSystem.oxygenStatus()
        } else {
            print("🚫 Access Denied")
        }
    }
    
    func requestDroneStatus(station: OrbitronSpaceStation){
        station.controlCenter.drone?.hasDroneTask()
        station.researchLab.drone?.hasDroneTask()
        station.lifeSupportSystem.drone?.hasDroneTask()
    }
}

let orbitronSpaceStation = OrbitronSpaceStation()
let missionControl = MissionControl()

missionControl.conncectWithOSS(station: orbitronSpaceStation, accesToken: "Qwerty1")
missionControl.requestControlCenterStatus(station: orbitronSpaceStation)
orbitronSpaceStation.controlCenter.drone?.task = "Check system"
orbitronSpaceStation.researchLab.drone?.task = "Remove used elements"
orbitronSpaceStation.lifeSupportSystem.drone?.task = "Help poor people"
missionControl.requestDroneStatus(station: orbitronSpaceStation)
missionControl.requestOxygenStatus(station: orbitronSpaceStation)
missionControl.requestControlCenterStatus(station: orbitronSpaceStation)
orbitronSpaceStation.ccLocker(password: "IncorrectPass")
orbitronSpaceStation.ccLocker(password: "Qwerty")
