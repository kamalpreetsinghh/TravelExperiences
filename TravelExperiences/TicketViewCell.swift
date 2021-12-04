//
//  TicketViewCell.swift
//  TravelExperiences
//
//  Created by Karan on 2021-12-02.
//

import UIKit

class TicketViewCell: UITableViewCell {

    @IBOutlet weak var activityName: UILabel!
    @IBOutlet weak var activityPrice: UILabel!
    @IBOutlet weak var numberOfTickets: UILabel!
    @IBOutlet weak var contactinfo: UILabel!
    @IBOutlet weak var contactnumber: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
