//
//  LoginViewController.swift
//  Instagram2.0
//
//  Created by Victor Li Wang on 2/29/16.
//  Copyright © 2016 Victor Li Wang. All rights reserved.
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func onSignIn(sender: AnyObject) {
        PFUser.logInWithUsernameInBackground(usernameField.text!, password: passwordField.text!) { (user: PFUser?, error: NSError?) -> Void in
            if user != nil {
                print("logged in")
                self.performSegueWithIdentifier("loginSegue", sender: nil)
            }
        }
    }
    
    @IBAction func onSignUp(sender: AnyObject) {
        
        if(usernameField.text != "" && passwordField.text != "") {
            let newUser = PFUser()
            
            newUser.username = usernameField.text
            newUser.password = passwordField.text
            
            newUser.signUpInBackgroundWithBlock { (success:Bool, error: NSError?) -> Void in
                if success {
                    print("created a user")
                    self.performSegueWithIdentifier("loginSegue", sender: nil)
                } else {
                    print(error?.localizedDescription)
                    if error!.code == 202 {
                        print("username is taken")
                    }
                }
            }
            
        }
        
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
