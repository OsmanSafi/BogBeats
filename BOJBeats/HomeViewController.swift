//
//  HomeViewController.swift
//  BOJBeats
//
//  Created by Jared Lopez on 10/27/22.
//

import UIKit
import Parse
import MessageInputBar

class HomeViewController: UIViewController {

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

    @IBAction func onLogout(_ sender: Any) {
        PFUser.logOut()
                        
        let main = UIStoryboard(name: "Main", bundle: nil)
        let loginViewController = main.instantiateViewController(withIdentifier: "LoginViewController")
                        
        let delegate = self.view.window?.windowScene?.delegate as! SceneDelegate
                        
        delegate.window?.rootViewController = loginViewController
    }
}
