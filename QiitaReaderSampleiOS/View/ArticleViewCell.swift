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
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configure(with article: Article) {
        self.title.text = article.title
        self.userName.text = article.user.id
        self.date.text = article.date
        if let url = URL(string: article.user.imgUrl) {
            URLSession.shared.dataTask(with: url) { (data, _, _) in
                guard let data = data else {
                    return
                }
                DispatchQueue.main.async {
                    self.userImage?.image = UIImage(data: data)
                }
            }.resume()
        }
    }
}
