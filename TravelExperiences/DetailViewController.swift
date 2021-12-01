import UIKit

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func addToFavs() {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        let favsVC = storyboard.instantiateViewController(identifier: "Favourites") as! FavouritesViewController
        
        self.navigationController?.pushViewController(favsVC, animated: true)
    }
}
