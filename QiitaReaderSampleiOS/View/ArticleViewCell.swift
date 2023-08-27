//
//  ArticleViewCell.swift
//  QiitaReaderSampleiOS
//
//  Created by apple on 2023/08/26.
//

import UIKit

class ArticleViewCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var date: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
