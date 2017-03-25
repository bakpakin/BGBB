import UIKit
import Alamofire
import Kanna

class ScheduleViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var team: [String] = []
    
    let textCellIdentifier = "ShowCell"

    
    @IBOutlet var BGBLTableView: UITableView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        BGBLTableView.delegate = self
        BGBLTableView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return team.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: textCellIdentifier, for: indexPath)
        return cell
    }
    
}


