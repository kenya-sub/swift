//
//  ListViewController.swift
//  NewsReader
//
//  Created by 高橋 京介 on 2017/10/25.
//  Copyright © 2017年 Kyosuke Takahashi. All rights reserved.
//

import UIKit

class ListViewController: UITableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            return cell
    }
}
