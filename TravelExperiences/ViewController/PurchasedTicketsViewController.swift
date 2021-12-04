//
//  PurchasedTicketsViewController.swift
//  TravelExperiences
//
//  Created by Karan on 2021-12-01.
//

import UIKit

class PurchasedTicketsViewController: UIViewController {

    var thingsToDo: ThingsToDo? = nil
    
    @IBOutlet weak var activityName: UILabel!
    @IBOutlet weak var activityPrice: UILabel!
    @IBOutlet weak var customerName: UITextField!
    @IBOutlet weak var customerContact: UITextField!
    @IBOutlet weak var ticketCount: UIStepper!
    @IBOutlet weak var ticketCountLabel: UILabel!
    @IBOutlet weak var totalPrice: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        loadActivityDetails()
        self.navigationItem.title = "Book Ticket"
    }
    

    @IBAction func changeTicketCount(_ sender: Any) {
        self.ticketCountLabel.text = "\(self.ticketCount.value)"
        
        guard let receivedActivityDetails = self.thingsToDo else {
            return
        }
        
        self.totalPrice.text = "\(self.ticketCount.value * receivedActivityDetails.price)"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logout))
    }
    
    @IBAction func checkout(_ sender: Any) {
            guard let receivedActivityDetails = self.thingsToDo else {
                return
            }
            
        let ticket = Ticket(customerName: self.customerName.text ?? "", customerContact: self.customerContact.text ?? "", thingsToDo: receivedActivityDetails,totalPrice: Double(self.totalPrice.text ?? "") ?? 0.0,ticketCount: Int(self.ticketCountLabel.text ?? "") ?? 0)
        
            UsersDB.shared.currentUser.tickets.append(ticket)
            
            let alert = UIAlertController(title: "Item Purchased", message: "Thankyou for purchasing \(receivedActivityDetails.name)", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title:"OK", style: .default, handler: {(alert:UIAlertAction!)-> Void in})
            alert.addAction(okAction)
            
            self.present(alert, animated:true, completion:nil)
    }
    
    @IBAction func viewTickets(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        let ticketsVC = storyboard.instantiateViewController(identifier: "purchasedticketscreen") as! TicketsTableViewController
                
        self.navigationController?.pushViewController(ticketsVC, animated: true)
    }
    
    private func loadActivityDetails () {
        guard let receivedActivityDetails = self.thingsToDo else {
            self.activityName.text = "Unavailable"
            self.activityPrice.text = "$0.00"
            return
        }
        
        self.activityName.text = receivedActivityDetails.name
        self.activityPrice.text = "$\(receivedActivityDetails.price)"
        self.totalPrice.text = "\(receivedActivityDetails.price)"
    }
    
    
    @IBAction func logout(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
        UserDefaults.standard.set("", forKey: "KEY_REMEMBER_ME")
    }
    
}
