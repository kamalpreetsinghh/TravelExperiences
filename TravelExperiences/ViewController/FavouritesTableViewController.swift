//
//  FavouritesTableViewController.swift
//  TravelExperiences
//
//  Created by Rahul Vashist on 02/12/21.
//

import UIKit

class FavouritesTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Favourites"
        self.tableView.rowHeight = 150
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Delete All", style: .plain, target: self, action: #selector(deleteAll))
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var favList = UserDefaults.standard.array(forKey: "\(UsersDB.shared.currentUser.name).favorites") as? [String] ?? [String]()
        
        return favList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ViewCell", for: indexPath) as! FavouritesCellTableViewCell

        var favList = UserDefaults.standard.array(forKey: "\(UsersDB.shared.currentUser.name).favorites") as? [String] ?? [String]()
        
        
        var obj = ThingsToDoDB.shared.getObjByName( favList[indexPath.row].description)
        cell.title.text = obj!.name
        cell.price.text = "$\(obj!.price)"
        cell.activityImg.image = UIImage(named: obj!.images[0])
        return cell
    }

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            var favList = UserDefaults.standard.array(forKey: "\(UsersDB.shared.currentUser.name).favorites") as? [String] ?? [String]()
            favList.remove(at: indexPath.row)
            UserDefaults.standard.set(favList, forKey: "\(UsersDB.shared.currentUser.name).favorites")
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    @IBAction func deleteAll() {
        print("fsdfds")
        var favList = UserDefaults.standard.array(forKey: "\(UsersDB.shared.currentUser.name).favorites") as? [String] ?? [String]()
        favList.removeAll()
        UserDefaults.standard.set(favList, forKey: "\(UsersDB.shared.currentUser.name).favorites")
        [tableView .reloadData()]
        
    }
}
