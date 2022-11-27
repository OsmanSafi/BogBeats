//
//  ArtistInfoViewController.swift
//  BOJBeats
//
//  Created by Jared Lopez on 11/26/22.
//

import UIKit
import AlamofireImage
import AVFoundation

class ArtistInfoViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var artistPik: UIImageView!
    
    @IBOutlet weak var artistName: UILabel!
    
    var artist: [String:Any]!
    
    var moreMusic = [[String:Any]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        artistName.text = artist["name"] as? String
        artistName.sizeToFit()
        
        
        let baseUrl = "https://api.napster.com/imageserver/v2/artists/"
                
        let backdropPath = artist["id"] as! String
        
                        
        let albumUrl = URL(string: baseUrl + backdropPath + "/images/70x70.jpg" )
        
        artistPik.af_setImage(withURL: albumUrl!)
        
        let artId = artist["id"] as! String
        
        let startURL = "https://api.napster.com/v2.2/artists/"
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func back(_ sender: Any) {
        dismiss(animated: true , completion: nil)
    }
}
