import UIKit

class SymptomsSelection: UITableViewController {

    var checked = [Bool]() // Have an array equal to the number of cells in your table
    
    let symptomsArray = ["Cough", "Shortness of Breath", "Pain in Chest", "Daze", "Fever", "Extreme Fatigue"]
    let symptomsDescription = ["Cough", "Shortness of Breath", "Pain in Chest", "Daze", "Fever", "Extreme Fatigue"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        checked = Array(repeating: false, count: symptomsArray.count)
        
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return symptomsArray.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        if let cell = tableView.cellForRow(at: indexPath as IndexPath) {
            if cell.accessoryType == .checkmark {
                cell.accessoryType = .none
                checked[indexPath.row] = false
            } else {
                cell.accessoryType = .checkmark
                checked[indexPath.row] = true
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "symptomsCell", for: indexPath)
        
        if checked[indexPath.row] == false{
            
            cell.accessoryType = .none
            
        }else if checked[indexPath.row] {
            cell.accessoryType = .checkmark
        }
        
        let symptoms = symptomsArray[indexPath.row]
        let description = symptomsDescription[indexPath.row]
        
        cell.textLabel?.text = symptoms
        cell.detailTextLabel?.text = description
        
        return cell
    }
