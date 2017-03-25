//
//  FAQViewController.swift
//  BGBB_Options
//
//  Created by Nathan Canterbury on 3/24/17.
//  Copyright © 2017 Nathan Canterbury. All rights reserved.
//

import UIKit
class FAQViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var checkValid = false
    
    
    
   
    
    // Don't forget to enter this in IB also
    let cellReuseIdentifier = "cell"
    
    @IBOutlet var tableView: UITableView!
    var dataSource = [ExpandingTableViewCellContent]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let swipeRight: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(swipeRight)
        
        
        // delegate and data source
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        // Along with auto layout, these are the keys for enabling variable cell height
        tableView.estimatedRowHeight = 44.0
        tableView.rowHeight = UITableViewAutomaticDimension
        
        dataSource = [ExpandingTableViewCellContent(title: "When was the Boston Gay Basketball League formed?", subtitle: "The league was formed in the Fall of 1994."),
            ExpandingTableViewCellContent(title: "Where are games held?", subtitle: "Registration begins in early October, and the season will start in November. We have a mini-camp for all new players to attend. The camp lasts about 2 hours and consists of new players running through a few drills and playing pick-up games to give coaches a chance to evaluate players prior to the season’s draft. The date and time will be sent out in our Court Reporter in September. You can sign-up for our mailing list by entering your e-mail address in the space provided on the left sidebar. The season concludes with playoffs and a banquet at the beginning of April."),
            ExpandingTableViewCellContent(title: "When does the season begin?", subtitle: "Registration begins in early October, and the season will start in November. We have a mini-camp for all new players to attend. The camp lasts about 2 hours and consists of new players running through a few drills and playing pick-up games to give coaches a chance to evaluate players prior to the season’s draft. The date and time will be sent out in our Court Reporter in September. You can sign-up for our mailing list by entering your e-mail address in the space provided on the left sidebar. The season concludes with playoffs and a banquet at the beginning of April."),
            ExpandingTableViewCellContent(title: "How many games do you play?", subtitle: "There are 15 regular season games for Division 1 and 14 regular season games for Division 2. The playoffs will take place after the regular season has ended. Note: You must play more than half of the games (8) to qualify for the season-ending playoffs."),
            ExpandingTableViewCellContent(title: "How many levels are there?", subtitle: "There are two divisions - Division 1 and Division 2. Division 1 is for the more competitive/advanced player. Division 2 is for the recreational/intermediate and beginner player. There is also a women's only league, which you can find more information on by checking out the WGBL website."),
            ExpandingTableViewCellContent(title: "What days are games held?", subtitle: "The majority of games are played on Saturdays starting at 10:00 am and ending at 5:00 pm. Each team will have a handful of their games on Thursday night."),
            ExpandingTableViewCellContent(title: "Is there a limit to the number of players that can play in a season?", subtitle: "Yes. There are 6 Division 1 teams and 8 Division 2 teams. Each team is allowed 9 players. For our off-season pick-up leagues, we will cap registration at 20 players per division. All seasons are first come, first served."),
            ExpandingTableViewCellContent(title: "I don't know that much about the game, can I still participate?", subtitle: "Absolutely. Beginners are always welcome, as are players of all experience."),
            ExpandingTableViewCellContent(title: "How are the teams picked?", subtitle: "Players are chosen through a draft system by the league captains before the season begins. In order to keep the teams even, advanced players are encouraged to play in Division 1; while recreational, intermediate and beginner level players are encouraged to play in Division 2."),
            ExpandingTableViewCellContent(title: "Are there playoffs?", subtitle: "Yes. At the conclusion of each season the teams battle it out in playoffs to win their division championship followed by an end of the year banquet with trophies and awards."),
            ExpandingTableViewCellContent(title: "Are there practice sessions?", subtitle: "Yes. We have practice every Thursday night. Practice is at Madison Park. The address and directions are located here."),
            ExpandingTableViewCellContent(title: "Do you have to be gay to play in the league?", subtitle: "Absolutely not. The league fosters an athletic environment free of discrimination for members and friends of the Lesbian, Gay, Bisexual and Transgender (LGBT) community. It also promotes positive values in our community and will fight to eliminate negative stereotypes associated with LGBT athletics."),
            ExpandingTableViewCellContent(title: "How does one become a sponsor of a team?", subtitle: "The teams are sponsored by a number of businesses around Boston—see the sponsor link on the website. To inquire about sponsorship and its benefits, send an email to the league."),
            ExpandingTableViewCellContent(title: "Who do I contact to sign up?", subtitle: "You can sign up to be put on the mailing list. If you have any questions, you may also contact the Commissioner, Kevin St. Gelais, at ksg.bgbl@gmail.com.")]
        
        //Get the height of the status bar 
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        
        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets 
    }
    
    func swipeRight(recognizer : UISwipeGestureRecognizer) {
        self.performSegue(withIdentifier: "MySegue", sender: self)
    }
    
    func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.right:
                self.performSegue(withIdentifier: "MySegue", sender: self)
            default:
                break
            }
        }
    }
    
    // number of rows in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:ExpandingTableViewCell = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as! ExpandingTableViewCell
        cell.set(content: dataSource[indexPath.row])
        
        return cell
    }
    
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let content = dataSource[indexPath.row]
        content.expanded = !content.expanded
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}
