//
//  TableViewController.swift
//  Glimpse
//
//  Created by Renzee Reyes on 11/18/14.
//  Copyright (c) 2014 Renzee Reyes. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    // Initialize array of custom cells
    var myCells: Array<(cellImage: UIImage, cellLikes: String, cellComments: String)> = []
    
    // UIColor representing theme color
    let lightColor: UIColor = UIColor(red: 0.992, green: 0.89, blue: 0.655, alpha: 1)
    
    // Initialize UIRefreshControl
    var refresh:UIRefreshControl!
    
    // Initialize UITableView on laod
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Visual properties
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.SingleLine
        self.tableView.backgroundColor = lightColor
        
        // Refresh properties
        self.refresh = UIRefreshControl()
        self.refresh.addTarget(self, action: "invokeRefresh", forControlEvents: UIControlEvents.ValueChanged)
        self.refresh.attributedTitle = NSAttributedString(string: "Pull to refersh")
        self.tableView.addSubview(refresh)
        
        // Seed data
        myCells.append(cellImage: UIImage(named: "placeholder.png")!, cellLikes: "32 Likes", cellComments: "> Awesome pic! Where was this pic taken?\n> wow this looks really familiar\n> I think this is by my house")
        myCells.append(cellImage: UIImage(named: "placeholder.png")!, cellLikes: "28 Likes", cellComments: "> Awesome pic! Where was this pic taken?\n> wow this looks really familiar\n> I think this is by my house")
        myCells.append(cellImage: UIImage(named: "placeholder.png")!, cellLikes: "19 Likes", cellComments: "> Awesome pic! Where was this pic taken?\n> wow this looks really familiar\n> I think this is by my house")
        myCells.append(cellImage: UIImage(named: "placeholder.png")!, cellLikes: "32 Likes", cellComments: "> Awesome pic! Where was this pic taken?\n> wow this looks really familiar\n> I think this is by my house")
        myCells.append(cellImage: UIImage(named: "placeholder.png")!, cellLikes: "28 Likes", cellComments: "> Awesome pic! Where was this pic taken?\n> wow this looks really familiar\n> I think this is by my house")
        myCells.append(cellImage: UIImage(named: "placeholder.png")!, cellLikes: "19 Likes", cellComments: "> Awesome pic! Where was this pic taken?\n> wow this looks really familiar\n> I think this is by my house")
        myCells.append(cellImage: UIImage(named: "placeholder.png")!, cellLikes: "32 Likes", cellComments: "> Awesome pic! Where was this pic taken?\n> wow this looks really familiar\n> I think this is by my house")
        myCells.append(cellImage: UIImage(named: "placeholder.png")!, cellLikes: "28 Likes", cellComments: "> Awesome pic! Where was this pic taken?\n> wow this looks really familiar\n> I think this is by my house")
        myCells.append(cellImage: UIImage(named: "placeholder.png")!, cellLikes: "19 Likes", cellComments: "> Awesome pic! Where was this pic taken?\n> wow this looks really familiar\n> I think this is by my house")

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    // On refresh, update refresh properties
    func invokeRefresh() {
        self.tableView.reloadData()
        
        var formatter = NSDateFormatter()
        formatter.dateFormat = "MMM d 'at' h:mm a"
        var lastUpdate = "Last update: \(formatter.stringFromDate(NSDate()))"
        let attriString = NSAttributedString(string:lastUpdate, attributes:
            [NSForegroundColorAttributeName: UIColor.blackColor()])
        self.refresh.attributedTitle = attriString
        self.refresh.endRefreshing()
        
    }
    
    override func viewDidLayoutSubviews() {
        self.tableView.separatorInset = UIEdgeInsetsZero
        self.tableView.layoutMargins = UIEdgeInsetsZero
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    // Return number of sections within table
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        if (myCells.count > 0) {
            return 1;
        } else {
            var messageLabel = UILabel(frame: CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height))
            
            messageLabel.text = "No data currently available\nPull down to refresh"
            messageLabel.textAlignment = NSTextAlignment.Center
            messageLabel.numberOfLines = 0
            messageLabel.font = UIFont (name: "Palatino-Italic", size: 20)

            
            self.tableView.backgroundView = messageLabel;
            self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        }
        return 0;
    }

    // Return number of rows in section
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return myCells.count
    }

    // Initialize cells for each row
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as CustomCell
        
        
        // Configure the cell...
        //let cellID:String = "Cell"
        //var cell:UITableViewCell = tableView
        cell.separatorInset = UIEdgeInsetsZero
        cell.layoutMargins = UIEdgeInsetsZero
        cell.cellComments.numberOfLines = 0
        cell.cellComments.font = UIFont(name: "Arial Unicode MS", size: 16)
        cell.cellLikes.font = UIFont(name: "Arial Unicode MS", size: 16)
        
        // Text properties
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 0
        paragraphStyle.lineHeightMultiple = 0.8
        
        // Comment properties
        var commentAttriString = NSMutableAttributedString(string: myCells[indexPath.row].cellComments as String)
        commentAttriString.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: NSMakeRange(0, commentAttriString.length))
        
        // Set values of cell
        cell.cellComments.attributedText = commentAttriString
        cell.cellLikes.text = myCells[indexPath.row].cellLikes as String
        cell.cellImage.image = myCells[indexPath.row].cellImage as UIImage

        return cell
    }
    
    func degToRad(deg: Int) -> Float {
        return Float(deg) * Float(M_PI / 180.0)
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
