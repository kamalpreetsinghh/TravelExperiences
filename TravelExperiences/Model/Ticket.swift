import Foundation

struct Ticket {
    let customerName: String
    let customerContact: String
    let thingsToDo : ThingsToDo
    let totalPrice: Double
    let ticketCount: Int
    
    init() {
        self.customerName = "Unknown"
        self.customerContact = "(999) 999-9999"
        self.thingsToDo = ThingsToDo()
        self.totalPrice = 0.0
        self.ticketCount = 0
    }
    
    init (customerName: String, customerContact: String, thingsToDo: ThingsToDo, totalPrice: Double, ticketCount: Int) {
        self.customerName = customerName
        self.customerContact = customerContact
        self.thingsToDo = thingsToDo
        self.totalPrice = totalPrice
        self.ticketCount = ticketCount
    }
}

