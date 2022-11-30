//
//  TopArtistViewController.swift
//  BOJBeats
//
//  Created by Jared Lopez on 11/26/22.
//

import UIKit
import AlamofireImage

class TopArtistViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var artists = [[String:Any]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        
      
        // Do any additional setup after loading the view.
        
                let url = URL(string: "http://api.napster.com/v2.2/artists/top?apikey=OGEwOTM0MmQtOWQ1Yy00MDk1LWI5MTYtYWZkOGUwZGE5Yzk5&range=week")!
                let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
                let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
                let task = session.dataTask(with: request) { (data, response, error) in
                     // This will run when the network request returns
                     if let error = error {
                            print(error.localizedDescription)
                     } else if let data = data {
                            let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                         
                            self.artists = dataDictionary["artists"] as! [[String:Any]]
                         
                            self.tableView.reloadData()
                         
                            print(dataDictionary)
                         
                            
                            // TODO: Get the array of movies
                            // TODO: Store the movies in a property to use elsewhere
                            // TODO: Reload your table view data
                     }
                }
            task.resume()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return artists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = UITableViewCell()
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SongCell") as! SongCell

        let song = artists[indexPath.row]

        let title = song["name"] as! String
                

        cell.SongName.text = title
                
                
        let baseUrl = "https://api.napster.com/imageserver/v2/artists/"
                
        let backdropPath = song["id"] as! String
        
                        
        let albumUrl = URL(string: baseUrl + backdropPath + "/images/70x70.jpg" )
        
        
        cell.AlbumPoster.af_setImage(withURL: albumUrl!)
                
        return cell
        
    }

    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        print("Loading up the details screen")
                
                //Find the selected movie
                let cell = sender as! UITableViewCell
                let indexPath = tableView.indexPath(for: cell)!
                
                let artist = artists[indexPath.row]
                //Pass the selected movie to the details view controller
                
                let detailsViewController = segue.destination as! ArtistInfoViewController
        
                detailsViewController.artist = artist

                
                tableView.deselectRow(at: indexPath, animated: true)
    }
    

    @IBAction func back(_ sender: Any) {
        dismiss(animated: true , completion: nil)
    }
}
