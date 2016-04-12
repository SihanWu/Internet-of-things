//
//  FoodViewController.swift
//  SampleBeacon
//
//  Created by 戴逸涵 on 15/12/4.
//  Copyright © 2015年 Yihan Dai. All rights reserved.
//

import UIKit

class FoodViewController: UIViewController {

    @IBOutlet weak var quantity: UITextField!
    
    @IBOutlet weak var labelname: UILabel!
    @IBOutlet weak var photoImage: UIImageView!
    @IBAction func add(sender: AnyObject) {
        
        let add_num = Int(quantity.text!)
        quantity.text = String(add_num! + 1)
        
    }
    var datapassed = 0
    var secondDataPassed = ""
    
 
    @IBOutlet weak var inforLabel: UILabel!
   
    @IBAction func minus(sender: AnyObject) {
        let delete_num = Int(quantity.text!)
        if (delete_num! == 0){
            quantity.text = "0"
        }
        else{
        quantity.text = String(delete_num! - 1)
        }
    }
    
    func show_info(photoId: Int, photoIdNumber: String){
        switch photoIdNumber{
        case "0x0100":
        switch photoId {
        case 0:
            let photo1 = UIImage(named: "meal1")!
            let name1 = "Caprese Salad"
            photoImage.image = photo1
            labelname.text = name1
            
        case 1:
            let photo2 = UIImage(named: "meal2")!
            let name2 = "Chicken and Potatoes"
            photoImage.image = photo2
            labelname.text = name2
            
        case 2:
            let photo3 = UIImage(named: "meal3")!
            let name3 = "Pasta with Meatballs"
            photoImage.image = photo3
            labelname.text = name3
        default: ()
        }
        
        case "0x0200":
            switch photoId {
            case 0:
                let photo1 = UIImage(named: "video1")!
                let name1 = "HALO 5 "
                photoImage.image = photo1
                labelname.text = name1
                
            case 1:
                let photo2 = UIImage(named: "video2")!
                let name2 = "ASSASS'S CREED - SYNDICATE"
                photoImage.image = photo2
                labelname.text = name2
            
            case 2:
                let photo3 = UIImage(named: "video3")!
                let name3 = "CALL OF DUTY"
                photoImage.image = photo3
                labelname.text = name3
            default: ()
            }
            
        case "0x0300":
            switch photoId {
            case 0:
                let photo1 = UIImage(named: "perfume1")!
                let name1 = "Channel No.5"
                photoImage.image = photo1
                labelname.text = name1
            default: ()
            }
            
        case "0x0400":
            switch photoId {
            case 0:
                let photo1 = UIImage(named: "furniture1")!
                let name1 = "Smithfield - Sofa"
                photoImage.image = photo1
                labelname.text = name1
            default: ()
            }
        
        case "0x0500":
            switch photoId {
            case 0:
                let photo1 = UIImage(named: "electronic1")!
                let name1 = "Google Glasses"
                photoImage.image = photo1
                labelname.text = name1
            default: ()
            }
        case "0x0600":
            switch photoId {
            case 0:
                let photo1 = UIImage(named: "clothes1")!
                let name1 = "Giorgio Armani - Jacket"
                photoImage.image = photo1
                labelname.text = name1
            default: ()
            }
            
        default: ()
    }
    
    }
    
    
    @IBAction func buyItem(sender: AnyObject) {
        print("Buy the item and send the item information to the main page")
        print(Variables.aVariable)
        
        
        if (Int(quantity.text!) == 0){
            inforLabel.text! = "Warning! Please input the item number!"
        }
        else{
            inforLabel.text! = "You have ordered this item! Thank You !"
            Variables.aVariable = Int(quantity.text!)!
            Variables.bvariable = secondDataPassed
            Variables.cartList[secondDataPassed] = Int(quantity.text!)!
            Variables.compare = true
            Variables.feedback = secondDataPassed
            let Alert = UIAlertController(title: "Welcome!", message: "Do you want to give a feedaback", preferredStyle: UIAlertControllerStyle.Alert)
            let action1 = UIAlertAction(title: "OK", style: UIAlertActionStyle.Destructive, handler: {action in self.performSegueWithIdentifier("ratingControl", sender: self)})
            let action2 = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default, handler: nil)
            Alert.addAction(action2)
            Alert.addAction(action1)
            
            let newAlert = UIAlertController(title: "Congratualations!", message: "This item is available", preferredStyle: UIAlertControllerStyle.Alert)
            let actionOK = UIAlertAction(title: "OK", style: UIAlertActionStyle.Destructive, handler:{action in self.presentViewController(Alert, animated: true, completion: nil)})
            let actionCancel = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default, handler: nil)
            newAlert.addAction(actionCancel)
            newAlert.addAction(actionOK)
            presentViewController(newAlert, animated: true, completion: nil)
            
            
        }
        
        
    }
    
    
    /*override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "sss") {
            var svc = segue.destinationViewController as! ViewController;
            svc.datapassed = quantity.text!
            svc.secondDataPassed = "010001"
        }
    }
    */
    override func viewDidLoad() {
        super.viewDidLoad()
        print(datapassed , secondDataPassed)
        var someString = secondDataPassed
        someString = String(someString.characters.dropLast(2))
        show_info(datapassed , photoIdNumber: someString)
        // Do any additional setup after loading the view.
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
