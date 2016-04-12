//
//  ProductViewController.swift
//  SampleBeacon
//
//  Created by 戴逸涵 on 15/12/12.
//  Copyright © 2015年 Yihan Dai. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController {
    var productName = ""
    var photoName = ""
    
    let location = Variables.totalProduct[Variables.countNotification]["location"]
    let label = Variables.totalProduct[Variables.countNotification]["productLabel"]
    let major = Variables.totalProduct[Variables.countNotification]["majorValue"]
    
    @IBOutlet weak var ProductInfo: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    
    
    func switchPhoto (beaconMajor: Int , photoLabel: String) ->(small:String , large:String){
        switch beaconMajor{
        case 65510:
            switch photoLabel{
                case "Firstitem":
                    productName = "Caprese Salad"
                    photoName = "meal1"
                case "Seconditem":
                    productName = "Chicken and Potatoes"
                    photoName = "meal2"
                case "Thirditem":
                    productName = "Pasta with Meatballs"
                    photoName = "meal3"
            default: ()
            }
        case 65511:
            switch photoLabel{
            case "Firstitem":
                productName = "HALO 5"
                photoName = "video1"
            case "Seconditem":
                productName = "Assassin's Creed - Syndicate"
                photoName = "video2"
            case "Thirditem":
                productName = "Pasta with Meatballs"
                photoName = "video3"
            default: ()
            }
        case 65512:
            switch photoLabel{
            case "Firstitem":
                productName = "Channel No.5"
                photoName = "perfume1"
            default: ()
            }
            
        case 65513:
            switch photoLabel{
            case "Firstitem":
                productName = "Smithfield - Sofa"
                photoName = "furniture1"
            default: ()
            }
            
        case 65514:
            switch photoLabel{
            case "Firstitem":
                productName = "Google Glasses"
                photoName = "electronic1"
            default: ()
            }
            
        case 65515:
            switch photoLabel{
            case "Firstitem":
                productName = "Giorgio Armani - Jacket"
                photoName = "clothes1"
            default: ()
            }
        default: ()
        }
        
        
        return (productName,photoName)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let answer = switchPhoto(Int(major!)!, photoLabel: label!)
        let photo = UIImage(named:answer.large)
        photoImageView.image! = photo!
        labelName.text! = answer.small
        ProductInfo.text! = "Here is the information of your item! \nThe available quantity is 50. \nThe location is \(location!)."
        Variables.totalProduct.removeAtIndex(Variables.countNotification)
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
