//
//  GalleryTableCell.swift
//  WaterfallLayout
//
//  Created by user230315 on 11/7/22.
//

import UIKit

class GalleryTableCell: UITableViewCell {

    @IBOutlet weak var photo: UIImageView!
    static let identifier = "GalleryTableCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        photo.clipsToBounds = true
        photo.layer.cornerRadius = 12
    }
    static func nib() -> UINib {
              return UINib(nibName: "GalleryTableCell", bundle: nil)
          }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
