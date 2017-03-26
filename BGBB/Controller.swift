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
        
        return cell
    }
    
  /*  func URLtoImage(url : String) -> UIImage{
        let url = NSURL(string:"http://cdn.businessoffashion.com/site/uploads/2014/09/Karl-Lagerfeld-Self-Portrait-Courtesy.jpg")
        let data = NSData(contentsOfURL:url!)
        if data != nil {
            imageURL.image = UIImage(data:data!)
        }
    }
   */ 
}


