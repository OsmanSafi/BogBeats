//
//  songViewController.swift
//  BOJBeats
//
//  Created by Jared Lopez on 11/9/22.
//

import UIKit

class songViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

        var songs = [[String:Any]]()

        override func viewDidLoad() {
            super.viewDidLoad()
            
            tableView.dataSource = self
            tableView.delegate = self
            
            print("hello")
            
            let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
            let request = URLRequest(url: url, cachePolicy:
                    .reloadIgnoringLocalCacheData, timeoutInterval: 10)
            
            let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
            let task = session.dataTask(with: request) { (data, response, error) in
                 // This will run when the network request returns
                 if let error = error {
                        print(error.localizedDescription)
                 } else if let data = data {
                        let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                        self.songs = dataDictionary["results"] as! [[String:Any]]
                                      
                        self.tableView.reloadData()
                        // TODO: Get the array of movies
                        // TODO: Store the movies in a property to use elsewhere
                        // TODO: Reload your table view data

                 }
            }
            task.resume()
            print("world")
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "songTableViewCell") as! songTableViewCell
            
            let song = songs[indexPath.row]
            
            let title = song["title"] as! String
            let synopsis = song["overview"] as! String
            
            cell.titleLabel.text = title
            //cell.synopsisLabel.text = synopsis
            
            
            let baseUrl = "https://image.tmdb.org/t/p/w185"
            let posterPath = song["poster_path"] as! String
            
            let posterUrl = URL(string: baseUrl + posterPath)
            
            cell.posterView.af_setImage(withURL: posterUrl!)
            
            return cell
        }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) ->
            Int{
                return songs.count
        }
        
        // MARK: - Navigation
        // In a storyboard-based application, you will often want to do a little preparation before navigation
        override func prepare(for segue:UIStoryboardSegue, sender: Any?) {
            // Get the new view controller using segue.destination.
            // Pass the selected object to the new view controller.
            
            print("Loading up the details screen")
            
            //Find the selected movie
            let cell = sender as! UITableViewCell
            let indexPath = tableView.indexPath(for: cell)!
            
            let song = songs[indexPath.row]
            //Pass the selected movie to the details view controller
            
            let detailsViewController = segue.destination as! SongDetailsViewController
                            
            detailsViewController.song = song

            
            tableView.deselectRow(at: indexPath, animated: true)
            
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
