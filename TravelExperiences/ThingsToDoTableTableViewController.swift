import UIKit

class ThingsToDoTableTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.rowHeight = 150
        // create things to do
        self.createThingsToDos()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return ThingsToDoDB.shared.thingsToDos.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ThingsToDoCell", for: indexPath) as! ThingsToDoCell

        // Configure the cell...
        let thingsToDo = ThingsToDoDB.shared.thingsToDos[indexPath.row]
        print(thingsToDo.name)
        cell.lblName.text = thingsToDo.name
        cell.lblPrice.text = String(thingsToDo.price)
        cell.imgPhoto.image = UIImage(named: thingsToDo.imageName)
        
        return cell
    }
    
    //triggered when user clicks on any row
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let detailScreen = storyboard?.instantiateViewController(withIdentifier: "DetailScreen") as? DetailViewController else{
            return
        }
        
        self.navigationController?.pushViewController(detailScreen, animated: true)
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func createThingsToDos() {
        let thingsToDo1 = ThingsToDo(name: "Nighlife in Shinjuku", price: 150.00, img: "shinjuku")
        let thingsToDo2 = ThingsToDo(name: "Cherry Blossoms Tour at Tokyo", price: 100.00, img: "cherryblossom")
        let thingsToDo3 = ThingsToDo(name: "Food Tour at Kyoto", price: 250.00, img: "food")
        let thingsToDo4 = ThingsToDo(name: "Tokyo Tower Tour", price: 120.00, img: "tokyotower")
        
        ThingsToDoDB.shared.thingsToDos.append(thingsToDo1)
        ThingsToDoDB.shared.thingsToDos.append(thingsToDo2)
        ThingsToDoDB.shared.thingsToDos.append(thingsToDo3)
        ThingsToDoDB.shared.thingsToDos.append(thingsToDo4)
    }

}
