import UIKit

class ThingsToDoCell: UITableViewCell {

    @IBOutlet var lblPrice : UILabel!
    @IBOutlet var lblName: UILabel!
    
    @IBOutlet weak var imgPhoto: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
