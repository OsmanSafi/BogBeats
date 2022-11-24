//
//  SongListViewController.swift
//  BOJBeats
//
//  Created by Jared Lopez on 11/13/22.
//

import UIKit

class SongListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate { 

    @IBOutlet weak var tableView: UITableView!
    
    //    array of dictionary
        var songs = [[String:Any]]()
       //var songs = Dictionary<String, AnyObject>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
      
        // Do any additional setup after loading the view.
                let url = URL(string: "https://api.napster.com/v2.2/artists/top?apikey=OGEwOTM0MmQtOWQ1Yy00MDk1LWI5MTYtYWZkOGUwZGE5Yzk5")!
                let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
                let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
                let task = session.dataTask(with: request) { (data, response, error) in
                     // This will run when the network request returns
                     if let error = error {
                            print(error.localizedDescription)
                     } else if let data = data {
                            let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                         
                            self.songs = dataDictionary["artists"] as! [[String:Any]]
                         
                            self.tableView.reloadData()
                         
                            print(dataDictionary)
                            
                            // TODO: Get the array of movies
                            // TODO: Store the movies in a property to use elsewhere
                            // TODO: Reload your table view data
                     }
                }
            task.resume()

        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = UITableViewCell()
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SongCell") as! SongCell

        let song = songs[indexPath.row]

        let title = song["name"] as! String
                //let synopsis = song["overview"] as! String

                cell.SongName.text = title
                //cell.synopsisLabel.text = synopsis
                
                
                //let baseUrl = "https://image.tmdb.org/t/p/w185"
                //let posterPath = song["poster_path"] as! String
                
                //let posterUrl = URL(string: baseUrl + posterPath)
                
                //cell.posterView.af_setImage(withURL: posterUrl!)
                
                return cell
        
//        let song = [indexPath.row]
        
        //cell.textLabel!.text = "row: \(indexPath.row)"
        
        //return cell
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true , completion: nil)
    }
}
