//
//  HomeViewController.swift
//  BOJBeats
//
//  Created by Jared Lopez on 10/27/22.
//

import UIKit
import Parse
import MessageInputBar
import Foundation

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
//    array of dictionary
//    var songs = [[String:Any]]()
 //   var songs = Dictionary<String, AnyObject>()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
//        let song = [indexPath.row]
        
        cell.textLabel!.text = "row: \(indexPath.row)"
        
        return cell
    }
    

    @IBAction func onLogout(_ sender: Any) {
        PFUser.logOut()
                        
        let main = UIStoryboard(name: "Main", bundle: nil)
        let loginViewController = main.instantiateViewController(withIdentifier: "LoginViewController")
                        
        let delegate = self.view.window?.windowScene?.delegate as! SceneDelegate
                        
        delegate.window?.rootViewController = loginViewController
    }
}
