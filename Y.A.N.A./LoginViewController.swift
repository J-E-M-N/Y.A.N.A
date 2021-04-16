//
//  LoginViewController.swift
//  Y.A.N.A.
//
//  Created by Nigel Powell on 4/14/21.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //automatically sign in (if previously logged in)
    override func viewDidAppear(_ animated: Bool) {
         let currentUser = PFUser.current()
         if currentUser != nil {
            self.performSegue(withIdentifier: "loginSegue", sender: nil)
         }
     }
    
    //sign in to Y.A.N.A.
    @IBAction func OnSignIn(_ sender: Any) {
        let username = usernameField.text
        let password = passwordField.text
        
        PFUser.logInWithUsername(inBackground: username!, password: password!){
            (user, error) in
            if user != nil {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            } else {
                print("Error: \(String(describing: error?.localizedDescription))")
            }
            }
        }
    
    //sign up for Y.A.N.A.
    @IBAction func OnSignUp(_ sender: Any) {
        let user = PFUser()
        user.username        = usernameField.text
        user.password        = passwordField.text
        user["pimsSent"]     = 0
        user["pimsReceived"] = 0
        user["myPIMS"]       = []
        
        
        user.signUpInBackground { (success, error) in
            if success {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            } else {
                print("Error: \(String(describing: error?.localizedDescription))")
            }
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

}
