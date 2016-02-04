//
//  eventlistTableViewController.swift
//  Teacher Solutions Events
//
//  Created by Aidan Cornelius-Bell on 4/02/2016.
//  Copyright © 2016 Teacher Solutions, Pty Ltd. All rights reserved.
//

import UIKit

class eventlistTableViewController: UITableViewController {
    var tableViewData = NSArray()
    var nextIndexPath = NSInteger()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.refreshControl = UIRefreshControl()
        self.refreshControl!.addTarget(self, action: "refresh:", forControlEvents: UIControlEvents.ValueChanged)

        let eventURL: NSURL = NSURL(string: "https://www.teachersolutions.com.au/events.json")!
        
        let data = NSData(contentsOfURL: eventURL)!
        
        self.tableView.rowHeight = 88.0
        
        do {
            // Instantiate some JSON serialziation
            if let json = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments) as? NSDictionary {
                print("Dictionary; ", json)
            } else if let json = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments) as? NSArray {
                tableViewData = json
            }
        } catch {
            print("Error serializing JSON \(error)")
        }
    }
    
    func refresh(sender:AnyObject) {
        let eventURL: NSURL = NSURL(string: "https://www.teachersolutions.com.au/events.json")!
        
        let data = NSData(contentsOfURL: eventURL)!
        
        do {
            // Instantiate some JSON serialziation
            if let json = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments) as? NSDictionary {
                print("Dictionary; ", json)
            } else if let json = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments) as? NSArray {
                tableViewData = json
            }
        } catch {
            print("Error serializing JSON \(error)")
        }
        
        self.refreshControl!.endRefreshing()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewData.count // data.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        let cellTitle = tableViewData[indexPath.row]["title"] as! String
        
        let cellSubtitle = tableViewData[indexPath.row]["location"] as! String
        
        let cellDate = tableViewData[indexPath.row]["date_from"] as! String
        
        if let titleView = cell.viewWithTag(1) as? UILabel {
            titleView.text = cellTitle
        }
        
        if let titleView = cell.viewWithTag(2) as? UILabel {
            titleView.text = cellSubtitle
        }
        
        if let dateView = cell.viewWithTag(3) as? UILabel {
            dateView.text = cellDate
            dateView.layer.cornerRadius = 5.0
            dateView.clipsToBounds = true
        }
        
        //cell.textLabel?.text = cellTitle
        
        //cell.detailTextLabel?.text = cellSubtitle

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        nextIndexPath = indexPath.row
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let destination = segue.destinationViewController as? detailTableViewController {
                destination.dataDictionary = self.tableViewData[nextIndexPath] as? NSDictionary
            }
        }
    }
}
