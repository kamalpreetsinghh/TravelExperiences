import UIKit

class ThingsToDoCell: UITableViewCell {

    @IBOutlet var lblPrice : UILabel!
    @IBOutlet var imgPhoto: UIImageView!
    @IBOutlet var lblName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
