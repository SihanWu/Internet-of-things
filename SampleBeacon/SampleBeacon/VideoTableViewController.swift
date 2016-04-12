//
//  VideoTableViewController.swift
//  SampleBeacon
//
//  Created by 戴逸涵 on 15/12/12.
//  Copyright © 2015年 Yihan Dai. All rights reserved.
//

import UIKit

class VideoTableViewController: UITableViewController {

    var arrayMeal = [
        0: "0x020001",
        1: "0x020002",
        2: "0x020003"
    ]
    
    var videos = [Meal]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load the sample data.
        loadvideo()
    }
    
    func loadvideo() {
        let photo1 = UIImage(named: "video1")!
        let video1 = Meal(name: "HALO 5", photo: photo1, rating: 4)!
        
        let photo2 = UIImage(named: "video2")!
        let video2 = Meal(name: "ASSASSIN'S CREED - SYNDICATE", photo: photo2, rating: 4)!
        
        let photo3 = UIImage(named: "video3")!
        let video3 = Meal(name: "CALL OF DUTY 11", photo: photo2, rating: 5)!
        
        videos += [video1, video2, video3]
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "VideoTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! VideoTableViewCell
        
        // Fetches the appropriate meal for the data source layouts
        let video = videos[indexPath.row]
        
        
        cell.nameLabel.text = video.name
        cell.photoImageView.image = video.photo
        cell.ratingControl.rating = video.rating
        
        return cell
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        self.performSegueWithIdentifier("showview2", sender: self)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "showview2") {
            
            
            let svc = segue.destinationViewController as! FoodViewController;
            let indexpath = tableView.indexPathForSelectedRow!
            let idNumber = indexpath.row
            svc.datapassed = idNumber
            svc.secondDataPassed = arrayMeal[idNumber]!
            
        }
    }
    
    @IBAction func myUnwindAction(unwindSegue: UIStoryboardSegue)
    {
        print("ssssss")
        
    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
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
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
