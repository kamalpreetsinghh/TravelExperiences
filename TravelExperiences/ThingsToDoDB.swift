import Foundation

class ThingsToDoDB {
    // singleton setup
    
    static let shared = ThingsToDoDB()
    
    private init() {
        
    }
    
    // resource the singleton should manage
    var thingsToDos: [ThingsToDo] = []
    
    func getThingsToDos() -> [ThingsToDo] {
        return self.thingsToDos
    }
    
}
