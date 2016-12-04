//
//  ViewController.swift
//  Connect
//
//  Created by Anoop on 7/18/16.
//  Copyright © 2016 Anoop. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Firebase



//var dbRef:FIRDatabaseReference!
var interestsRef:FIRDatabaseReference!
var userFIRUser:FIRUser?
var fbServiceController:FBServiceController?

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func postDataToRTDBMS()  {
        
        //        interestsRef = FIRDatabase.database().reference().child("Interests")
        //        let childRef = interestsRef.observeEventType(.Value, withBlock: {(snap:FIRDataSnapshot) in
        //
        //        })
        //
        //        print(childRef)
    }

    
    
    func firebaseLogin(_ credential: FIRAuthCredential) {
        //showSpinner({
        if let user = FIRAuth.auth()?.currentUser {
            // [START link_credential]
            user.link(with: credential) { (user, error) in
                // [START_EXCLUDE]
                //                    self.hideSpinner({
                //                        if let error = error {
                //                            self.showMessagePrompt(error.localizedDescription)
                //                            return
                //                        }
                //                    })
                // [END_EXCLUDE]
            }
            // [END link_credential]
        } else {
            // [START signin_credential]
            FIRAuth.auth()?.signIn(with: credential) { (user, error) in
                // [START_EXCLUDE]
                //self.hideSpinner({
                //                        if let error = error {
                //                            self.showMessagePrompt(error.localizedDescription)
                //                            return
                //                        }
                // })
                // [END_EXCLUDE]
            }
            // [END signin_credential]
        }
        //})
    }
    
    @IBAction func facebookLoginAction(_ sender: AnyObject) {
        
        // post value
        //        ref.child("tempForData").setValue("From Client")
        
        //        let loginManager = FBSDKLoginManager()
        //          loginManager.logInWithReadPermissions(["email", "public_profile"], fromViewController: self, handler: { (result, error) in
        //         if let error = error {
        //         //self.showMessagePrompt(error.localizedDescription)
        //
        //         } else if(result.isCancelled) {
        //         print("FBLogin cancelled")
        //         } else {
        //        // [START headless_facebook_auth]
        //            }
        //
        //        let credential = FIRFacebookAuthProvider.credentialWithAccessToken(FBSDKAccessToken.currentAccessToken().tokenString)
        //        // [END headless_facebook_auth]
        //        self.firebaseLogin(credential)
        //
        //            if (FBSDKAccessToken.currentAccessToken() == nil){
        //
        //            }else{
        //                self.returnUserData()
        //            }
        //        })
        //
        //        let user = FIRAuth.auth()?.currentUser;
        ////        let email = user!.email
        ////        let userid = user!.uid
        ////        let photoURL = user!.photoURL
        //
        //        postDataToRTDBMS()
        self.performSegue(withIdentifier: "interestVC", sender: nil)
    }
    
    
    @IBAction func guestLoginAction(_ sender: AnyObject) {
        
        userFIRUser = FBServiceController().loginwithType(AuthProvider.authEmail)
       
        /*FIRAuth.auth()?.signInAnonymouslyWithCompletion() { (user, error) in
            // [START_EXCLUDE]
            if let error = error {
                print(error.localizedDescription)
                return
            }
            userFIRUser = user
            self.performSegueWithIdentifier("interestVC", sender: userFIRUser)
            
            // [END_EXCLUDE]
        }*/
    }
    
    
    func returnUserData()
    {
        
        let graphRequest : FBSDKGraphRequest = FBSDKGraphRequest(graphPath: /*"/10207793741460565/interests"*/"me/likes", parameters: nil)
        graphRequest.start(completionHandler: { (connection, result, error) -> Void in
            
            if ((error) != nil)
            {
                // Process error
                print("Error: \(error)")
            }
            else
            {
                //let error :NSError?
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: result, options: JSONSerialization.WritingOptions.prettyPrinted)
                    // here "jsonData" is the dictionary encoded in JSON data
                } catch let error as NSError {
                    print(error)
                }
                
                print(result)
                
                //                self.facebookid = result.valueForKey("id") as NSString!
                //                self.username = result.valueForKey("name") as NSString!
                //                self.userEmail = result.valueForKey("email") as NSString!
                //                println(result) // This works
                
                
            }
        })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(segue.identifier != "interestVC") {
            
            let interestVC = segue.destination as! InterestVC
            interestVC.userSerssion = userFIRUser!.uid  ?? ""
        }
    }
}

