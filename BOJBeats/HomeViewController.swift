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
    
    
    @IBOutlet weak var tableView: UITableView!
    
//    array of dictionary
//    var songs = [[String:Any]]()
    var songs = Dictionary<String, AnyObject>()

    
    override func viewDidLoad() {
        super.viewDidLoad()

    
        tableView.dataSource = self
        tableView.delegate = self
        
        // Do any additional setup after loading the view.
        print("Hello")
        
        
        let url = URL(string: "https://spotify23.p.rapidapi.com/artist_singles/?id=2w9zwq3AktTeYYMuhMjju8&offset=0&limit=20")!
//        if let unwrappedURL = url {
            var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
            request.addValue("e6684c4c3emsh52e37b85d087b61p166619jsn4d8eb88ae1b3", forHTTPHeaderField: "X-RapidAPI-Key")
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                // you should put in error handling code, too
                if let data = data {
                    do {
                        let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! Dictionary<String, AnyObject>
                        
                        // HERE'S WHERE YOUR DATA IS
                        //Try pull artist or song
//                        self.songs = dataDictionary["data"] as! [[String:Any]]
                        self.songs = dataDictionary["data"] as! Dictionary<String, AnyObject>

                        print(dataDictionary)
                        print("Some data printed")

                    } catch {
                        print(error)
                    }
                }
            }
            task.resume()
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
