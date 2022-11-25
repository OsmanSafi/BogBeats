//
//  SongInfoViewController.swift
//  BOJBeats
//
//  Created by Jared Lopez on 11/13/22.
//

import UIKit
import AlamofireImage
import AVFoundation
import AVFAudio

class SongInfoViewController: UIViewController {
    
    @IBOutlet weak var AlbumImage: UIImageView!
    
   
    @IBOutlet weak var Artist: UILabel!
    
    @IBOutlet weak var SongName: UILabel!
    
    var songplayer: AVAudioPlayer?
    
    var song: [String:Any]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        SongName.text = song["name"] as? String
        SongName.sizeToFit()
        
        Artist.text = song["artistName"] as? String
        Artist.sizeToFit()
        
        let baseUrl = "https://api.napster.com/imageserver/v2/albums/"
        
        let backdropPath = song["albumId"] as! String
        
        
        let albumUrl = URL(string: baseUrl + backdropPath + "/images/300x300.jpg" )
        
        
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
        
        playSaveSound()
    }
    
    @IBAction func backButtoninfo(_ sender: Any) {
        dismiss(animated: true , completion: nil)
    }
    func playSaveSound(){
        
        let songmp3 = song["previewURL"] as! URL
        
        //let path = Bundle.main.path(forResource: songmp3, ofType: nil)!
        //let url = URL(fileURLWithPath: songmp3)
        //let url = URL(string: songmp3)
        //let url = URL(resource: songmp3)
        
        do {
            //create your audioPlayer in your parent class as a property
            songplayer = try AVAudioPlayer(contentsOf: songmp3)
            songplayer?.play()
        } catch {
            print("couldn't load the file")
        }
    }
}
