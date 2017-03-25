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
        self.scrapeBGBL()
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

    func scrapeBGBL() -> Void {
        var shows: [String] = []
        
        let textCellIdentifier = "ShowCell"
        

        
        Alamofire.request("http://bgbl.com/2016-2017-schedule").responseString { response in
            print ("\(response.result.isSuccess)")
            if let html  = response.result.value {
                //self.parseHTML(html: html)
                
            }
        }
        func parseHTML(html: String) -> Void {
            // Finish this next
            if let doc = Kanna.HTML(html:html, encoding: String.Encoding.utf8){
            
                for team in doc.css("#tablepress-4 tbody tr"){
                        
                }
            }
        }

    }
    
}


