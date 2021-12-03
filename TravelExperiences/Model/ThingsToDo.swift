import Foundation

struct ThingsToDo {
    let name: String
    let price: Double
    let images : [String]
    let description: String
    let rating: Int
    let contactNumber: String
    
    init() {
        self.name = "Unknown"
        self.price = 0.0
        self.images = ["shinjuku.png"]
        self.description = ""
        self.rating = 0
        self.contactNumber = "(999) 999-9999"
    }
    
    init (name: String, price: Double, images: [String], description: String, rating: Int, contactNumber: String) {
        self.name = name
        self.price = price
        self.images = images
        self.description = description
        self.rating = rating
        self.contactNumber = contactNumber
    }
    
    
}
