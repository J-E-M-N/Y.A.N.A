//
//  PIMsViewController.swift
//  Y.A.N.A.
//
//  Created by Earl Tankard, Jr. on 4/20/21.
//

import UIKit
import Parse

class PIMsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var myPIMs = [String]()
    @IBAction func refresh(_ sender: Any) {
        self.getData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myPIMs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PIMCell") as! PIMCell
        
        cell.message.text = myPIMs[indexPath.row]
        
        return cell
    }
    
    func getData() {
        let cur_user = PFUser.current()
        let queryUsers = PFQuery(className: "_User")
        queryUsers.includeKeys(["objectId", "myPIMS"])

        queryUsers.findObjectsInBackground{(users, error) in

            if users != nil {
                
                var pimIDs = [String]()
                
                for user in users! {
                    if user.objectId! == cur_user?.objectId! {
//                        print("User matched:\(String(describing: cur_user?.username))\n\(self.myPIMs)")
                        print("User matched:\(String(describing: cur_user?.username))")
//                        self.myPIMs = user["myPIMS"] as! [String]
                        pimIDs = user["myPIMS"] as! [String]
                        break
                    }
                }
                
                let queryPIMs = PFQuery(className: "PIM")
                queryPIMs.includeKeys(["objectId","message"])
                
                queryPIMs.findObjectsInBackground{(pims, error) in
                    
                    if pims != nil {
                        for id in pimIDs {
                            for pim in pims! {
                                if id == pim.objectId {
                                    self.myPIMs.append(pim["message"] as! String)
                                    break
                                }
                            }//end for pims
                        }//end for pimIDs
                        
                        self.tableView.reloadData()

                        
                    }
                    
                }
                
                
            }

            else {
                print("Error: \(String(describing: error))")
            }


        }

    }
    

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate   = self
        getData()
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
