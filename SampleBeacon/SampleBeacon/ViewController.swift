//
//  ViewController.swift
//  SampleBeacon
//
//  Created by 戴逸涵 on 15/11/25.
//  Copyright © 2015年 Yihan Dai. All rights reserved.
//

import UIKit
import CoreLocation
import AudioToolbox

struct Variables {
    static var aVariable = 0
    static var bvariable = "ID"
    static var cartList = [String: Int]()
    static var response = String()
    static var compare = true
    static var valiadation = [String: String]()
    static var feedback = String()
    static var totalProduct = [[String: String]]()
    static var countNotification = Int()
    static var beacondistrict : [[String:Int]] = [["major": 65510],["major": 65511],["major": 65512],["major": 65513],["major": 65514],["major": 65515]]
    static var beacondistrictCompare : [[String:Int]] = [["major": 65510],["major": 65511],["major": 65512],["major": 65513],["major": 65514],["major": 65515]]
    static var totalProductCompare = [[String: String]]()
}

class ViewController: UIViewController, CLLocationManagerDelegate {
    var locationManager: CLLocationManager!
    
    @IBOutlet weak var beaconDistance: UILabel!
    //var datapassed = "0"
    //var secondDataPassed = "0"
    var ipaddress = "cloudgroup7.cloudapp.net:8080"
    var message = ""
    

    
    
    

    @IBOutlet weak var distanceReading: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        
        //view.backgroundColor = UIColor.grayColor()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status == .AuthorizedAlways {
            if CLLocationManager.isMonitoringAvailableForClass(CLBeaconRegion.self) {
                if CLLocationManager.isRangingAvailable() {
                    startScanning()
                }
            }
        }
    }
    
    
    func startScanning() {
        let uuid = NSUUID(UUIDString: "74278BDA-B644-4520-8F0C-720EAF059935")!
        let beaconRegion = CLBeaconRegion(proximityUUID: uuid, identifier: "beacon01")
        
        locationManager.startMonitoringForRegion(beaconRegion)
        locationManager.startRangingBeaconsInRegion(beaconRegion)
    }
    
    func updateDistance(distance: CLProximity) {
        UIView.animateWithDuration(0.5) { [unowned self] in
            switch distance {
            case .Unknown:
                self.view.backgroundColor = UIColor.grayColor()
                self.distanceReading.text = "UNKNOWN"
                
            case .Far:
                self.view.backgroundColor = UIColor.blueColor()
                self.distanceReading.text = "FAR"
                
            case .Near:
                self.view.backgroundColor = UIColor.orangeColor()
                self.distanceReading.text = "NEAR"
                self.httpPost("You have entered the district")
                
            case .Immediate:
                self.view.backgroundColor = UIColor.redColor()
                self.distanceReading.text = "RIGHT HERE"
            }
        }
    }
    
    func detectbeacon(beacon_type : Int) ->String{
        switch beacon_type {
        case 65510:
            message = "Caprese Salad is 50%, You can take it with only $7.99 "
        case 65511:
            message = "HALO 5 is 30%, You can buy it with only $29.99 "
        case 65512:
            message = "Channel NO.5 for only $99.99 per 50ml"
        case 65513:
            message = "A matrix is only $299.99! Do not miss it!"
        case 65514:
            message = "Google Glasses for $599.99! Grab the savings! "
        case 65515:
            message = "Giorgio Armani's jackect is only $499.99! Buy it now!"
        default: ()
        }
        return message
    }

    
    func locationManager(manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], inRegion region: CLBeaconRegion) {
        print(beacons)
        print(beacons[0])
        NSLog("The value of integer num is %.2f", beacons[0].accuracy)
        let ww = String(format:"%.2f",beacons[0].accuracy )
        print(ww)
        let num = Float(ww)
        print(num!)
        //beaconDistance.text! = ww
        var i = 0
        
        for (index,values) in Variables.beacondistrict.enumerate(){
            if values["major"] == beacons[0].major.integerValue {
                if beacons[0].accuracy < 2.5 && beacons[0].accuracy > 0{
                let Message = detectbeacon(beacons[0].major.integerValue)
                var soundID = SystemSoundID(kSystemSoundID_Vibrate)
                AudioServicesPlaySystemSound(soundID)
                let Alert = UIAlertController(title: "HELLO!", message: "You have entered the district! Here is Today's deal: \(Message)", preferredStyle: UIAlertControllerStyle.Alert)
                let actionOK = UIAlertAction(title: "OK", style: UIAlertActionStyle.Destructive, handler:{action in Variables.beacondistrict.removeAtIndex(index)} )
                let actionCancel = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default, handler: {(action) in
                    if index < Variables.beacondistrict.count{
                    

                        Variables.beacondistrict.removeAtIndex(index)
                    
                    }
                    }
                    )
                Alert.addAction(actionCancel)
                Alert.addAction(actionOK)
                    if !Variables.beacondistrict[index].isEmpty {
                        presentViewController(Alert, animated: true, completion: nil)}
                }
            }
        }
        print(Variables.beacondistrict)
        while i < beacons.count{
        print(beacons[i].major.integerValue)
        print(String(format:"%.2f",beacons[i].accuracy))
        print(beacons[i].rssi)
            
            if !Variables.totalProduct.isEmpty{
                for (index,value) in Variables.totalProduct.enumerate(){
                
                let major = value["majorValue"]
                    if Int(major!)! == beacons[i].major.integerValue{
                    let distance = Double(value["distance"]!)
                        print(distance!)
                    print("You have got the baber")
                    print(String(format:"%.2f",beacons[i].accuracy))
                
                    if beacons[i].accuracy < distance && beacons[i].accuracy > 0{
                    Variables.countNotification = index
                    let newAlert = UIAlertController(title: "HELLO!", message: "You have entered the district! Do you want to scan your ordered product's information", preferredStyle: UIAlertControllerStyle.Alert)
                    let actionOK = UIAlertAction(title: "OK", style: UIAlertActionStyle.Destructive, handler:{action in self.performSegueWithIdentifier("showInformation", sender: self)} )
                        let actionCancel = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default, handler: {action in
                            if index < Variables.totalProduct.count{
                            
                                Variables.totalProduct.removeAtIndex(index) 
                    } })
                    newAlert.addAction(actionCancel)
                    newAlert.addAction(actionOK)
                    if !Variables.totalProduct[index].isEmpty {
                        var soundID = SystemSoundID(kSystemSoundID_Vibrate)
                        AudioServicesPlaySystemSound(soundID)
                        presentViewController(newAlert, animated: true, completion: nil)
                    }
                    }
                }
            }
        }
        i = i+1
    }
        
        if Variables.cartList.isEmpty{}
        else{
            if Variables.compare{
                
                    httpPost(Variables.bvariable)
                }
                Variables.compare = false
            
            
        }
        if Variables.response != ""{
        let letters = Variables.response.componentsSeparatedByString(",")
        var letterNum = 0
        while letterNum < letters.count{
            if letterNum  == 0{
               let letters1 = String(letters[letterNum].characters.dropFirst(2))
               let letters2 = String(letters1.characters.dropLast())
               Variables.valiadation["majorValue"] = letters2
            }
            if letterNum == 1{
               let letters1 = String(letters[letterNum].characters.dropFirst(2))
               let letters2 = String(letters1.characters.dropLast())
               Variables.valiadation["productLabel"] = letters2
            }
            if letterNum == 2{
               let letters1 = String(letters[letterNum].characters.dropFirst(2))
               let letters2 = String(letters1.characters.dropLast())
               Variables.valiadation["distance"] = letters2
                
            }
            if letterNum == 3{
                let letters1 = String(letters[letterNum].characters.dropFirst(2))
                let letters2 = String(letters[5].characters.dropLast(2))
                let location = letters1 + "," + letters[4] + "," + letters2
                Variables.valiadation["location"] = location
            }
            
            
            letterNum = letterNum + 1
        }
        
        print(letters.count)
            for num in letters{
                print(num)
            }
        Variables.totalProduct.append(Variables.valiadation)
        Variables.totalProductCompare = Variables.totalProduct
        Variables.response = ""
        }
        
        
        
        //print(datapassed)
        //print(secondDataPassed)
        print(Variables.aVariable , Variables.bvariable)
        print(Variables.response)
        print(Variables.valiadation)
        print(Variables.totalProduct)
        print(Variables.feedback)
        //if beacons.count > 0 {
           // let beacon = beacons[0]
           // updateDistance(beacon.proximity)
       // } else {
         //   updateDistance(.Unknown)
        //}
    }
    /*@IBAction func myUnwindAction(unwindSegue: UIStoryboardSegue)
    {
        print("ssssss")
        
    }*/
    
    
    func httpPost(command:String){  //post the message to the raspberri pi
        print("ip is "+ipaddress)
        let request = NSMutableURLRequest(URL: NSURL(string:
            "http://"+ipaddress)!)
        request.HTTPMethod = "POST"
        let postString = command
        request.HTTPBody =    //send the request with the data
            postString.dataUsingEncoding(NSUTF8StringEncoding)
        let task =
        NSURLSession.sharedSession().dataTaskWithRequest(request) {
            data, response, error in
            if error != nil {
                print("error=\(error)")
                return}
            print("response = \(response)")
            let responseString = NSString(data: data!, encoding:
                NSUTF8StringEncoding)
            print("responseString = \(responseString)") //print the response from the server
            Variables.response = String(responseString!)
        }
        task.resume()
    }
}

