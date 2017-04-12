import UIKit

class TableViewCell: UITableViewCell{
    @IBOutlet weak var image1: UIImageView!

    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var Date: UILabel!
}
class ScheduleViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var team: [String] = []
    
    let textCellIdentifier = "ShowCell"
    
    @IBOutlet weak var BGBLTableView: UITableView!
    
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
        let cell = tableView.dequeueReusableCell(withIdentifier: textCellIdentifier) as! TableViewCell
        let temp : WebsiteData
        temp = WebsiteData()
        let info : LeagueData!
        info = LeagueData()
        temp.loadSchedule(info)
        let team1_name = info.schedule[0].team1.name
        let team2_name = info.schedule[0].team2.name
        let date = info.schedule[0].date
        let location = info.schedule[0].location
        cell.label1.text = team1_name
        cell.label2.text = team2_name
        cell.Date.text = date
        return cell
    }
}
