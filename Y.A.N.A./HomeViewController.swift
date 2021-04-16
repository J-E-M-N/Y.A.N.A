//
//  HomeViewController.swift
//  Y.A.N.A.
//
//  Created by Earl Tankard, Jr. on 4/16/21.
//

import UIKit
import Parse


class HomeViewController: UIViewController {
    @IBOutlet weak var dailyPIM: UILabel!
    
    @IBAction func sendPIM(_ sender: Any) {
        print("Sending PIM...")
    }
    
    //get a new PIM
    //TODO:
    //  **- update label dailyPIM
    //  - add ID to current user's myPIMs on server
    @IBAction func receivePIM(_ sender: Any) {
        print("Getting PIM...")
        let queryPIMs = PFQuery(className: "PIM")
        queryPIMs.includeKeys(["objectId", "message"])
//        query.limit = 20
        
        
        queryPIMs.findObjectsInBackground {(pims, error) in
            if pims != nil {
                print("Got PIMs!")
                
                let index = Int.random(in:0..<pims!.count)
                
                //update label
                self.dailyPIM.text = (pims![index]["message"] as! String)
                
                //update database
                let user = PFUser.current()!
                
                var updatedUser = PFObject(className: "User")
                
                updatedUser      = user
                var oldMyPIMsArr = user["myPIMS"] as! Array<String>
                oldMyPIMsArr.append(pims![index].objectId!)
                updatedUser.setObject(oldMyPIMsArr, forKey: "myPIMS")
                updatedUser["pimsReceived"] = oldMyPIMsArr.count

                updatedUser.saveInBackground {(success, error) in
                    if success {
                        print("Updated \(user["username"] as! String)")
                    }
                    else {
                        print("Error: \(String(describing: error))")
                    }
                    
                }//end saveInBackground
                print(updatedUser)
            }
            
        }//end findObjectsInBackground
    }//end receivePIM
    
    
    @IBAction func createPIM(_ sender: Any) {
        print("Creating PIM...")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
