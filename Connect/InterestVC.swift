//
//  InterestVC.swift
//  Connect
//
//  Created by Anoop on 7/24/16.
//  Copyright © 2016 Anoop. All rights reserved.
//


import UIKit
import CoreData
import FBSDKCoreKit
import Fabric
import Firebase
import FBSDKLoginKit
import FirebaseStorage

class InterestVC: UIViewController {
    
    internal var userSerssion:String = "3u0xKwLKoPYngFVaQ73eEMKjKwI2"

    @IBAction func interestSelectionDoneAction(_ sender: AnyObject) {
        
        
    }
    let refDB:FIRDatabaseReference = FIRDatabase.database().reference()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Get the Interest List
        
        let draggableViewBackground = DraggableViewBackground(frame: self.view.frame)
        self.view.addSubview(draggableViewBackground);
        
        let interestsRef = refDB.child("Interests")
        let childRef = interestsRef.observe(.value, with: {(snap:FIRDataSnapshot) in

            print(snap)
        })

        print(childRef)
        
        // get the user
        let userData = refDB.child("Users").child(userSerssion)
        // pass hours/airport/interest type
        let childRefuserData = userData.observe(.value, with: {(snap:FIRDataSnapshot) in
            
            print(snap)
        })
        
        // get the iterarries
        let itineraryData = refDB.child("Users").child(userSerssion).child("Itineraries")
        // get the details
        let irRefuserData = itineraryData.observe(.value, with: {(snap:FIRDataSnapshot) in
            
            print(snap)
        })
        let itineraryDetails = refDB.child("Itinerary").child("DXB").child("5h").child("Adventure")
        // get the route
        
        let itdeRefuserData = itineraryDetails.observe(.value, with: {(snap:FIRDataSnapshot) in
            
            print(snap)
        })
        
        
        let itineraryDetailsRoute = refDB.child("IniteraryDetails").child("1")
        // get the route
        
        let itdfdsdeRefuserData = itineraryDetailsRoute.observe(.value, with: {(snap:FIRDataSnapshot) in
            
            print(snap)
        })
        
        
        
        var storageRef:FIRStorageReference!
        storageRef = FIRStorage.storage().reference()
        
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentsDirectory = paths[0]
        let filePath = "file:\(documentsDirectory)/download.png"
        let storagePath = "Places/download.png"/*NSUserDefaults.standardUserDefaults().objectForKey("storagePath") as! String*/
        
        // [START downloadimage]
        storageRef.child(storagePath).write(toFile: URL.init(string: filePath)!,
                                                  completion: { (url, error) in
                                                    if let error = error {
                                                        print("Error downloading:\(error)")
                                                        //self.statusTextView.text = "Download Failed"
                                                        return
                                                    }

        })
        
        
   
        
    }

}
