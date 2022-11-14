//
//  SongInfoViewController.swift
//  BOJBeats
//
//  Created by Jared Lopez on 11/13/22.
//

import UIKit

class SongInfoViewController: UIViewController {

    @IBOutlet weak var AlbumImage: UIImageView!
    
    
    @IBOutlet weak var SongName: UILabel!
    
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

    @IBAction func playSong(_ sender: Any) {
    }
    @IBAction func backButtoninfo(_ sender: Any) {
    }
}
