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
    
    func getObjByName(_ name: String) -> ThingsToDo? {
        for obj in thingsToDos {
            if obj.name == name {
                return obj
            }
        }
        return nil
        
    }
    
}
