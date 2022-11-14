//
//  SongCell.swift
//  BOJBeats
//
//  Created by Jared Lopez on 11/13/22.
//

import UIKit

class SongCell: UITableViewCell {

    @IBOutlet weak var AlbumPoster: UIImageView!
    
    @IBOutlet weak var SongName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
