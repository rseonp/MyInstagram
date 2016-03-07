//
//  MediaCell.swift
//  Instagram2
//
//  Created by Victor Li Wang on 3/6/16.
//  Copyright © 2016 Victor Li Wang. All rights reserved.
//

import UIKit
import Parse

class MediaCell: UITableViewCell {

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var captionLabel: UILabel!
    
    var media: PFObject! {
        didSet {
            let mediaFile = self.media["media"] as! PFFile
            mediaFile.getDataInBackgroundWithBlock{(imageData: NSData?, error: NSError?) -> Void in
                if error == nil {
                    if let imageData = imageData {
                        let image = UIImage(data:imageData)
                        self.photoImageView.image = image
                    }
                }
            }
            captionLabel.text = self.media["caption"] as? String

//            print("did set in mediacell")
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        photoImageView.layer.cornerRadius = 3
        photoImageView.clipsToBounds = true
        
        captionLabel.preferredMaxLayoutWidth = captionLabel.frame.size.width
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        captionLabel.preferredMaxLayoutWidth = captionLabel.frame.size.width
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
