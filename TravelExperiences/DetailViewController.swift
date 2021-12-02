//
//  DetailViewController.swift
//  TravelExperiences
//
//  Created by Karan on 2021-11-30.
//

import UIKit

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

    @IBAction func callBtn(_ sender: Any) {
        if let phoneCallURL = URL(string: "tel://\(123-123-1234)") {
            let application:UIApplication = UIApplication.shared
            if (application.canOpenURL(phoneCallURL)) {
                application.open(phoneCallURL, options: [:], completionHandler: nil)
            }
        }
    }
    
}
