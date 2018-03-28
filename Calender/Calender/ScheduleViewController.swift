//
//  ScheduleViewController.swift
//  Calender
//
//  Created by sakka kenya on 2018/03/26.
//  Copyright © 2018年 sakka kenya. All rights reserved.
//

import UIKit
import CoreData


class ScheduleViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    var addBtn: UIBarButtonItem!
    var table: UITableView!
    var memos: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let delegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        let scheduleDate = delegate.scheduleDate
        //print(scheduleDate)
        
        self.title = scheduleDate! + "日"
        self.view.backgroundColor = UIColor.cyan
        
        //addBtnを設置
        addBtn = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(onClick))
        self.navigationItem.rightBarButtonItem = addBtn
        
        //画面サイズを取得
        let width: CGFloat! = self.view.bounds.width
        let height: CGFloat! = self.view.bounds.height
        
        //テーブルを表示
        table = UITableView(frame: CGRect(x:0, y:0, width:width, height:height))
        table.register(UITableViewCell.self, forCellReuseIdentifier: "data")
        table.dataSource = self
        table.delegate = self
        self.view.addSubview(table)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // CoreDataからデータを読み込んで配列memosに格納する
        let appDel: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        let toDoContext = appDel.persistentContainer.viewContext
        let toDoRequest: NSFetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ToDoStore")
        // 並び順をdateの、昇順としてみる
        toDoRequest.sortDescriptors = [NSSortDescriptor(key: "date", ascending: true)]
        toDoRequest.returnsObjectsAsFaults = false
        do{
            let results = try toDoContext.fetch(toDoRequest) as! [ToDoStore]
            memos = []
            for data in results {
                memos.append(data.memo)
            }
        }catch{
            print(error)
        }
        
        // テーブル情報を更新する
        self.table.reloadData()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // addBtnをタップしたときのアクション
    @objc func onClick(sender: UIBarButtonItem!) {
        let editVC = EditViewController()
        self.navigationController?.pushViewController(editVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier:"data", for:indexPath) as UITableViewCell
        cell.textLabel?.text = memos[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memos.count
    }
    
    
}
