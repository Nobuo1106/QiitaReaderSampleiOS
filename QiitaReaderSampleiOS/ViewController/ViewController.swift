//
//  ViewController.swift
//  QiitaReaderSampleiOS
//
//  Created by apple on 2023/08/23.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var articles: [Article] = []
    var currentPage = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "ArticleViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "ArticleViewCell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 300
        self.tableView.delegate = self
        self.tableView.dataSource = self

        fetchArticles()
    }

    func fetchArticles() {
        NetworkManager.shared.getArticles(page: currentPage, perPage: 20) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let newArticles):
                    self?.articles.append(contentsOf: newArticles)
                    self?.tableView.reloadData()
                case .failure(let error):
                    print("Failed to fetch qiita articles: \(error)")
                }
            }
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleViewCell", for: indexPath) as? ArticleViewCell {
            cell.configure(with: articles[indexPath.row])
            return cell
        } else {
            return UITableViewCell()
        }
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let position = scrollView.contentOffset.y
        if position > (tableView.contentSize.height - 100 - scrollView.frame.size.height) {
            currentPage += 1
            fetchArticles()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
