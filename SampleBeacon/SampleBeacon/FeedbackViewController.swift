//
//  FeedbackViewController.swift
//  SampleBeacon
//
//  Created by 戴逸涵 on 15/12/8.
//  Copyright © 2015年 Yihan Dai. All rights reserved.
//

import UIKit

class FeedbackViewController: UIViewController {

    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    var photoImageName : String!
    var nameofProduct : String!
    let listPhoto : [String : String] = [
        "0x010001" : "meal1",
        "0x010002" : "meal2",
        "0x010003" : "meal3",
        "0x020001" : "video1",
        "0x020002" : "video2",
        "0x020003" : "video3",
        "0x030001" : "perfume1",
        "0x040001" : "furniture1",
        "0x050001" : "electronic1",
        "0x060001" : "clothes1"
    ]
    
    let listLabel : [String : String] = [
        "0x010001" : "Caprese Salad",
        "0x010002" : "Chicken and Potatoes",
        "0x010003" : "Pasta with Meatballs",
        "0x020001" : "HALO 5",
        "0x020002" : "ASSASSIN'S CREED - SYNDICATE",
        "0x020003" : "CALL OF DUTY 11",
        "0x030001" : "Channel No.5",
        "0x040001" : "Smithfield - Sofa",
        "0x050001" : "Google Glasses",
        "0x060001" : "Giorgio Armani - Jacket"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let photoname = switchPhoto(Variables.feedback)
        let photo1 = UIImage(named: photoname)
        let name1 = switchLabel(Variables.feedback)
        photoImageView.image = photo1
        labelName.text! = name1
        // Do any additional setup after loading the view.
    }
    
    func switchPhoto(photoIdNumber:String) ->String{
        for itemNumber in listPhoto.keys{
            if itemNumber == photoIdNumber{
                photoImageName = listPhoto[itemNumber]
            }
        }
        return photoImageName
    }
    
    func switchLabel(labelName:String)->String{
        for itemNumber in listLabel.keys{
            if itemNumber == labelName{
                nameofProduct = listLabel[itemNumber]
            }
        }
        return nameofProduct
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
