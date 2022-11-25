//
//  SongInfoViewController.swift
//  BOJBeats
//
//  Created by Jared Lopez on 11/13/22.
//

import UIKit
import AlamofireImage

class SongInfoViewController: UIViewController {

    @IBOutlet weak var AlbumImage: UIImageView!
    
    
    @IBOutlet weak var SongName: UILabel!
    
    var song: [String:Any]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        SongName.text = song["name"] as? String
        SongName.sizeToFit()
                
        let baseUrl = "https://api.napster.com/imageserver/v2/albums/"
                
        let backdropPath = song["albumId"] as! String
        
        print(backdropPath)
                        
        let albumUrl = URL(string: baseUrl + backdropPath + "/images/70x70.jpg" )
        print(albumUrl)
                        
        AlbumImage.af_setImage(withURL: albumUrl!)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func playSong(_ sender: Any) {
        
        
    }
    
    @IBAction func backButtoninfo(_ sender: Any) {
        dismiss(animated: true , completion: nil)
    }
}
