//
//  detailTableViewController.swift
//  Teacher Solutions Events
//
//  Created by Aidan Cornelius-Bell on 4/02/2016.
//  Copyright © 2016 Teacher Solutions, Pty Ltd. All rights reserved.
//

import UIKit
import SafariServices

class detailTableViewController: UITableViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    
    var dataDictionary: NSDictionary?
    var nextURL : NSURL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let eventTitle = dataDictionary?["title"] as? NSString {
            titleLabel.text = eventTitle as String
        }
        if let eventLocation = dataDictionary?["location"] as? NSString {
            locationLabel.text = eventLocation as String
        }
        if let eventDescription = dataDictionary?["description"] as? NSString {
            descriptionLabel.text = eventDescription as String
        }
        if let eventDate = dataDictionary?["date_from"] as? NSString {
            dateLabel.text = "On: " + (eventDate as String)
        }
        print(dataDictionary)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row == 5 {
            if let flyerURL = dataDictionary?["flyer_url"] as? NSString {
                nextURL = NSURL(string: flyerURL as String)
                
                let svc = SFSafariViewController(URL: nextURL!)
                self.presentViewController(svc, animated: true, completion: nil)
            }
        } else if indexPath.row == 6 {
            let svc = SFSafariViewController(URL: NSURL(string: "https://www.teachersolutions.com.au/events")!)
            self.presentViewController(svc, animated: true, completion: nil)
        }else {
            print(indexPath.row)
        }
    }
    
}
