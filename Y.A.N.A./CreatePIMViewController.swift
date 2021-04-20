//
//  CreatePIMViewController.swift
//  Y.A.N.A.
//
//  Created by Malcolm Johnson on 4/19/21.
//

import UIKit
import Parse


class CreatePIMViewController: UIViewController,UINavigationControllerDelegate {

    @IBOutlet weak var messageTextField: UITextField!
    @IBAction func onBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func createdPIMSubmitButton(_ sender: Any) {
        
        let createdPIMs = PFObject(className: "PIM")
        
        createdPIMs["message"] = messageTextField.text! as String
        createdPIMs["author"] = PFUser.current()?.username
            
        createdPIMs.saveInBackground {(success, error) in
            if success {
                print("Created Pim!")
            }
            else {
                print("Error: \(String(describing: error))")
            }
            
        }//end saveInBackground
        print(createdPIMs)
            }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

