//
//  FBServiceController.swift
//  Connect
//
//  Created by Anoop on 8/13/16.
//  Copyright © 2016 Anoop. All rights reserved.
//

import FBSDKCoreKit
import FBSDKLoginKit
import Firebase
import Foundation


enum AuthProvider {
    case authEmail
    case authAnonymous
    case authFacebook
}


var userfIR:FIRUser!

class FBServiceController: NSObject {
    
    
    class FBServiceController {
        static let sharedInstance = FBServiceController()
        fileprivate init() {} //This prevents others from using the default '()' initializer for this class.
        
    }
    
    func loginwithType(_ loginType: AuthProvider) -> FIRUser {
        
//        FIRAuth.auth()?.signInAnonymously() { (user, error) in
//            // [START_EXCLUDE]
//            if let error = error {
//                print(error.localizedDescription)
//                return user
//            }
//            else{
//             userfIR = user
//             return userfIR
//            }
//            
//        }
//        return userfIR
//    }
    
    return userfIR
    }
}
