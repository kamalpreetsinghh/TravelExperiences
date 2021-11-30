import Foundation

struct ThingsToDo {
    var name: String
    var price: Double
    var imageName : String
    
    init() {
        self.name = "Unknown"
        self.price = 0.0
        self.imageName = "charizard.png"
    }
    
    init (name: String, price: Double, img: String) {
        self.name = name
        self.price = price
        self.imageName = img
    }
}
