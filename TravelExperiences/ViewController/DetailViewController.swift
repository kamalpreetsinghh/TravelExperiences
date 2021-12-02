import UIKit

class DetailViewController: UIViewController {
    
    var thingsToDo: ThingsToDo? = nil
    
    // MARK: - Outlets
    @IBOutlet weak var activityName: UILabel!
    @IBOutlet weak var activityPrice: UILabel!
    @IBOutlet weak var firstImage: UIImageView!
    @IBOutlet weak var secondImage: UIImageView!
    @IBOutlet weak var activityDescription: UITextView!
    
//    @IBOutlet weak var imgRating1: UIImageView!
//    @IBOutlet weak var imgRating2: UIImageView!
//    @IBOutlet weak var imgRating3: UIImageView!
//    @IBOutlet weak var imgRating4: UIImageView!
//    @IBOutlet weak var imgRating5: UIImageView!
    
    @IBOutlet weak var contactNumber: UILabel!
    @IBOutlet weak var ratings: UISlider!
    
    let YELLOW_STAR = "yellowstar"
    let WHITE_STAR = "whitestar"
    let MAX_RATING = 5
        
    var starRatingImages: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayActivityDetails()
    }
    
    private func displayActivityDetails(){
        
        guard let receivedThingsToDo = self.thingsToDo else {
            self.activityName.text = "Unavailable"
            self.activityDescription.text = "Activity details unavailable form previous screen"
            self.firstImage.image = UIImage(named: "shinjuku")
            self.secondImage.image = UIImage(named: "shinjuku2")
            self.activityPrice.text = "$0.00"
            self.contactNumber.text = "(999) 999-9999"
            self.ratings.value = 0.0
            return
        }
        
//        getRatingImages(rating: receivedThingsToDo.rating)
        
        self.activityName.text = receivedThingsToDo.name
        self.activityDescription.text = receivedThingsToDo.description
        self.firstImage.image = UIImage(named: receivedThingsToDo.images[0])
        self.secondImage.image = UIImage(named: receivedThingsToDo.images[1])
        self.activityPrice.text = "$\(receivedThingsToDo.price)"
        self.contactNumber.text = receivedThingsToDo.contactNumber
        self.ratings.value = receivedThingsToDo.rating
        
//        self.imgRating1.image = UIImage(named: starRatingImages[0])
//        self.imgRating2.image = UIImage(named: starRatingImages[1])
//        self.imgRating3.image = UIImage(named: starRatingImages[2])
//        self.imgRating4.image = UIImage(named: starRatingImages[3])
//        self.imgRating5.image = UIImage(named: starRatingImages[4])
        
    }
    
    func addToFavs() {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        let favsVC = storyboard.instantiateViewController(identifier: "Favourites") as! FavouritesViewController
        
        self.navigationController?.pushViewController(favsVC, animated: true)
    }
    
    @IBAction func share(_ sender: Any) {
        let activityController = UIActivityViewController(activityItems: [activityName.text!], applicationActivities:  nil)
        present(activityController, animated: true, completion: nil)
    }
    
    @IBAction func buyItem(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        let purchaseVC = storyboard.instantiateViewController(identifier: "PurchaseScreen") as! PurchasedTicketsViewController
        
        purchaseVC.thingsToDo = self.thingsToDo
        
        self.navigationController?.pushViewController(purchaseVC, animated: true)
    }
    
    @IBAction func viewTickets(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        let ticketsVC = storyboard.instantiateViewController(identifier: "purchasedticketscreen") as! TicketsTableViewController
                
        self.navigationController?.pushViewController(ticketsVC, animated: true)
    }
    
    
//    private func getRatingImages (rating: Int) {
//        for _ in 1...rating {
//            starRatingImages.append(YELLOW_STAR)
//        }
//        if rating < MAX_RATING {
//            for _ in rating+1...MAX_RATING {
//                starRatingImages.append(WHITE_STAR)
//            }
//        }
//    }
    
   
}

