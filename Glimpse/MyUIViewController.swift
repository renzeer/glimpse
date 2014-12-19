//
//  MyUIViewController.swift
//  Glimpse
//
//  Created by Renzee Reyes on 12/6/14.
//  Copyright (c) 2014 Renzee Reyes. All rights reserved.
//

import UIKit

class MyUIViewController: UIViewController {
    
    // Outlets for main view elements
    @IBOutlet weak var container: UITableView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    // Declare UITableViewController
    var myTable = UITableViewController()
    
    // Reloads data on segment control toggle
    @IBAction func toggleSegmentedControl(sender: UISegmentedControl) {
        
        switch segmentedControl.selectedSegmentIndex
        {
        case 0:
            myTable.tableView.reloadData()
        case 1:
            myTable.tableView.reloadData()
        default:
            break; 
        }
    }
    
    // Initializes main view with child UITableView and turns on hidesBarsOnSwipe
    override func viewDidLoad() {
        super.viewDidLoad()
        myTable = self.childViewControllers[0] as UITableViewController
        navigationController?.hidesBarsOnSwipe = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
