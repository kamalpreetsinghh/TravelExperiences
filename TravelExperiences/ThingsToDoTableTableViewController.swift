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
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ThingsToDoDB.shared.thingsToDos.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ThingsToDoCell", for: indexPath) as! ThingsToDoCell

        // Configure the cell...
        let thingsToDo = ThingsToDoDB.shared.thingsToDos[indexPath.row]
        print(thingsToDo.name)
        cell.activityName.text = thingsToDo.name
        cell.activityPrice.text = String(thingsToDo.price)
        cell.activityImage.image = UIImage(named: thingsToDo.images[0])
        
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
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func createThingsToDos() {
        let thingsToDo1 = ThingsToDo(name: "Nighlife in Shinjuku", price: 150.00, images: ["shinjuku"], description: "", rating: 5)
        let thingsToDo2 = ThingsToDo(name: "Cherry Blossoms Tour at Tokyo", price: 100.00, images: ["cherryblossom"], description: "", rating: 4)
        let thingsToDo3 = ThingsToDo(name: "Food Tour at Kyoto", price: 250.00, images: ["food"], description: "", rating: 4)
        let thingsToDo4 = ThingsToDo(name: "Tokyo Tower Tour", price: 120.00, images: ["tokyotower"], description: "", rating: 5)
        
        ThingsToDoDB.shared.thingsToDos.append(thingsToDo1)
        ThingsToDoDB.shared.thingsToDos.append(thingsToDo2)
        ThingsToDoDB.shared.thingsToDos.append(thingsToDo3)
        ThingsToDoDB.shared.thingsToDos.append(thingsToDo4)
    }

}
