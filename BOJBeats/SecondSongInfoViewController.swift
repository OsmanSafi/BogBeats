//
//  SecondSongInfoViewController.swift
//  BOJBeats
//
//  Created by Jared Lopez on 11/26/22.
//

import UIKit

class SecondSongInfoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableview: UITableView!
    
    @IBOutlet weak var Songname: UILabel!
    
    @IBOutlet weak var artistname: UILabel!
    
    @IBOutlet weak var AlbumImage: UIImageView!
    
    var songss: [String:Any]!
    var moreMusic = [[String:Any]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Songname.text = songss["name"] as? String
        Songname.sizeToFit()
        
        artistname.text = songss["artistName"] as? String
        artistname.sizeToFit()
        
        let baseUrl = "https://api.napster.com/imageserver/v2/albums/"
        
        let backdropPath = songss["albumId"] as! String
        
        
        let albumUrl = URL(string: baseUrl + backdropPath + "/images/300x300.jpg" )
        
        
        AlbumImage.af_setImage(withURL: albumUrl!)
        
        let artId = songss["artistId"] as! String
        
        let startURL = "https://api.napster.com/v2.2/artists/"
        
        tableview.dataSource = self
        tableview.delegate = self

        // Do any additional setup after loading the view.
        let url = URL(string: startURL + artId + "/tracks?apikey=OGEwOTM0MmQtOWQ1Yy00MDk1LWI5MTYtYWZkOGUwZGE5Yzk5&limit=10")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
             // This will run when the network request returns
             if let error = error {
                    print(error.localizedDescription)
             } else if let data = data {
                    let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                 
                    self.moreMusic = dataDictionary["tracks"] as! [[String:Any]]
                 
                    self.tableview.reloadData()
                 
                    
                    // TODO: Get the array of movies
                    // TODO: Store the movies in a property to use elsewhere
                    // TODO: Reload your table view data
             }
        }
    task.resume()
    }
    
    @IBAction func playsong(_ sender: Any) {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return moreMusic.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = UITableViewCell()
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SongCell") as! SongCell

        let song = moreMusic[indexPath.row]

        let title = song["name"] as! String
                

        cell.SongName.text = title
                
                
        let baseUrl = "https://api.napster.com/imageserver/v2/albums/"
        
        let backdropPath = song["albumId"] as! String
        
                        
        let albumUrl = URL(string: baseUrl + backdropPath + "/images/70x70.jpg" )
        
        
        cell.AlbumPoster.af_setImage(withURL: albumUrl!)
        
        print (title)
        print(albumUrl)
                
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
                let indexPath = tableview.indexPath(for: cell)!
                
                let song = moreMusic[indexPath.row]
                //Pass the selected movie to the details view controller
                
                let detailsViewController = segue.destination as! SongInfoViewController
        
                detailsViewController.song = song

                
                tableview.deselectRow(at: indexPath, animated: true)
    }
    
    
    
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true , completion: nil)
    }
    
}
