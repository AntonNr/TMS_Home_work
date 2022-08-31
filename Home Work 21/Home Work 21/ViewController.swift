import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.rowHeight = UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ColoredTableViewCell", for: indexPath) as? ColoredTableViewCell {
            
            switch indexPath.row {
                
            case 0: cell.backgroundColor = .red
            case 1: cell.backgroundColor = .orange
            case 2: cell.backgroundColor = .yellow
            case 3: cell.backgroundColor = .green
            case 4: cell.backgroundColor = .cyan
            case 5: cell.backgroundColor = .blue
            case 6: cell.backgroundColor = .magenta
            default: break
                
            }
            
            cell.recolored = {
                self.view.backgroundColor = cell.backgroundColor
            }
            
            return cell
        }
        
        return UITableViewCell()
    }

        
}

