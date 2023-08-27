//
//  ViewController.swift
//  QiitaReaderSampleiOS
//
//  Created by apple on 2023/08/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UINib(nibName: "ArticleViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
