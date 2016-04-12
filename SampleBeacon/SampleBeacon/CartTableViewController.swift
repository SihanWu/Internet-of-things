//
//  ChartTableViewController.swift
//  SampleBeacon
//
//  Created by 戴逸涵 on 15/12/5.
//  Copyright © 2015年 Yihan Dai. All rights reserved.
//

import UIKit



class CartTableViewController: UITableViewController {
    var arrayCart = [
        "0x010001" : 0,
        "0x010002" : 1,
        "0x010003" : 2,
        "0x020001" : 3,
        "0x020002" : 4,
        "0x020003" : 5,
        "0x030001" : 6,
        "0x040001" : 7,
        "0x050001" : 8,
        "0x060001" : 9
    ]
    
    
    var carts = [Cart]()
    override func viewDidLoad() {
        super.viewDidLoad()
        if Variables.cartList.isEmpty{
           
        }
        else{
            for (idNumber, quantityNumber) in Variables.cartList{
                let idSerialNumber = idNumber
                let id = arrayCart[idSerialNumber]!
                loadCart(id, quantitynum: quantityNumber)
            }

            
            
        }
        
    }
    
    
    
    func loadCart(idnumber: Int, quantitynum: Int) {
        switch idnumber {
        case 0:
            let photo1 = UIImage(named: "meal1")!
            let cart1 = Cart(name: "Caprese Salad", photo: photo1, quantity: quantitynum)!
            carts += [cart1]
        case 1:
            let photo1 = UIImage(named: "meal2")!
            let cart1 = Cart(name: "Chicken and Potatoes", photo: photo1, quantity: quantitynum)!
            carts += [cart1]
        case 2:
            let photo1 = UIImage(named: "meal3")!
            let cart1 = Cart(name: "Pasta with Meatballs", photo: photo1, quantity: quantitynum)!
            carts += [cart1]
        case 3:
            let photo1 = UIImage(named: "video1")!
            let cart1 = Cart(name: "HALO 5", photo: photo1, quantity: quantitynum)!
            carts += [cart1]
        case 4:
            let photo1 = UIImage(named: "video2")!
            let cart1 = Cart(name: "ASSASSIN'S CREED - 6", photo: photo1, quantity: quantitynum)!
            carts += [cart1]
        case 5:
            let photo1 = UIImage(named: "video3")!
            let cart1 = Cart(name: "CALL OF DUTY - 11", photo: photo1, quantity: quantitynum)!
            carts += [cart1]
        case 6:
            let photo1 = UIImage(named: "perfume1")!
            let cart1 = Cart(name: "Channel No.5", photo: photo1, quantity: quantitynum)!
            carts += [cart1]
        
        case 7:
            let photo1 = UIImage(named: "furniture1")!
            let cart1 = Cart(name: "Smithfield - Sofa", photo: photo1, quantity: quantitynum)!
            carts += [cart1]
        case 8:
            let photo1 = UIImage(named: "electronic1")!
            let cart1 = Cart(name: "Google Glasses", photo: photo1, quantity: quantitynum)!
            carts += [cart1]
        case 9:
            let photo1 = UIImage(named: "clothes1")!
            let cart1 = Cart(name: "Giorgio Armani - Jacket", photo: photo1, quantity: quantitynum)!
            carts += [cart1]
        default: ()
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return carts.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "CartTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! CartTableViewCell
        
        // Fetches the appropriate meal for the data source layouts
        let cart = carts[indexPath.row]
        
        
        cell.nameLabel.text = cart.name
        cell.photoImageView.image = cart.photo
        cell.number.text = String(cart.quantity)
        
        return cell
    }

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
