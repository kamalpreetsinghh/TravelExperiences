import UIKit

class ThingsToDoTableTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.rowHeight = 155
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
        cell.activityName.text = thingsToDo.name
        cell.activityPrice.text = "$\(thingsToDo.price)"
        cell.activityImage.image = UIImage(named: thingsToDo.images[0])
        
        return cell
    }
    
    //triggered when user clicks on any row
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let detailScreen = storyboard?.instantiateViewController(withIdentifier: "DetailScreen") as? DetailViewController else{
            return
        }
        
        detailScreen.thingsToDo = ThingsToDoDB.shared.thingsToDos[indexPath.row]
        
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
        let thingsToDo1 = ThingsToDo(name: "Nighlife in Shinjuku", price: 150.00, images: ["shinjuku", "shinjuku2"], description: "Shinjuku City encompasses the buzzing clubs and karaoke rooms of neon-lit East Shinjuku and upscale hotel bars and restaurants in the Skyscraper District. Tokyo Metropolitan Building has a popular observation deck, and Mount Hakone rises over tranquil urban parkland. Galleries, theaters, and bookstores attract students from busy campuses. ", rating: 5, contactNumber: "(456) 123-0981")
        
        let thingsToDo2 = ThingsToDo(name: "Cherry Blossoms Tour at Tokyo", price: 100.00, images: ["cherryblossom", "cherryblossom2"], description: "Cherry Blossom is a massive part of Japan's culture and history. In ancient Japan, farmers used the blooming of the cherry blossom flowers to help them know it was time to plant their rice crops. The flowers were considered to be a representation of spring, hope, beauty and new life.", rating: 4, contactNumber: "(234) 687-1235")
        
        let thingsToDo3 = ThingsToDo(name: "Food Tour at Kyoto", price: 250.00, images: ["food", "food2"], description: "The traditional cuisine of Japan is based on rice with miso soup and other dishes. There is an emphasis on seasonal ingredients. Side dishes often consist of fish, pickled vegetables, and vegetables cooked in broth. Seafood is common, often grilled, but also served raw as sashimi or in sushi.", rating: 4, contactNumber: "(675) 236-0987")
        
        let thingsToDo4 = ThingsToDo(name: "Tokyo Tower Tour", price: 120.00, images: ["tokyotower", "tokyotower2"], description: "The Tokyo Tower is a communications and observation tower in the Shiba-koen district of Minato, Tokyo, Japan, built in 1958. At 332.9 meters, it is the second-tallest structure in Japan.The structure is an Eiffel Tower-inspired lattice tower that is painted white and international orange to comply with air safety regulations.", rating: 5, contactNumber: "(498) 354-8765")
        
        let thingsToDo5 = ThingsToDo(name: "Mount Fuji Tour", price: 250.00, images: ["mountfuji", "mountfuji2"], description: "Japan’s Mt. Fuji is an active volcano about 100 kilometers southwest of Tokyo. Commonly called “Fuji-san,” it’s the country’s tallest peak, at 3,776 meters. A pilgrimage site for centuries, it’s considered one of Japan’s 3 sacred mountains, and summit hikes remain a popular activity. Its iconic profile is the subject of numerous works of art, notably Edo Period prints by Hokusai and Hiroshige.", rating: 5, contactNumber: "(198) 465-8765")
        
        ThingsToDoDB.shared.thingsToDos.append(thingsToDo1)
        ThingsToDoDB.shared.thingsToDos.append(thingsToDo2)
        ThingsToDoDB.shared.thingsToDos.append(thingsToDo3)
        ThingsToDoDB.shared.thingsToDos.append(thingsToDo4)
        ThingsToDoDB.shared.thingsToDos.append(thingsToDo5)
    }

}
