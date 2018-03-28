//
//  EditViewController.swift
//  Calender
//
//  Created by sakka kenya on 2018/03/28.
//  Copyright © 2018年 sakka kenya. All rights reserved.
//

import UIKit
import CoreData

class EditViewController: UIViewController {
    
    var memoField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black
        self.title = "EDIT"
        
        // text field
        memoField = UITextField(frame: CGRect(x:50, y:100, width:300, height:100))
        memoField.borderStyle = UITextBorderStyle.roundedRect
        self.view.addSubview(memoField)
        
        // write button
        let writeBtn: UIButton = UIButton(frame: CGRect(x:100, y:250, width:200, height:30))
        writeBtn.backgroundColor = UIColor.red
        writeBtn.setTitle("ToDoを保存", for: UIControlState.normal)
        writeBtn.addTarget(self, action: #selector(writeData), for: UIControlEvents.touchUpInside)
        self.view.addSubview(writeBtn)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // CoreDataへの書き込み処理（writeBtnのアクション）
    @objc func writeData(sender: UIButton!) {
        let appDel: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        let toDoContext: NSManagedObjectContext = appDel.persistentContainer.viewContext
        let toDoEntity: NSEntityDescription! = NSEntityDescription.entity(forEntityName:"ToDoStore", in:toDoContext)
        let newData = ToDoStore(entity: toDoEntity, insertInto: toDoContext)
        newData.memo = memoField.text!
        newData.date = Date()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
