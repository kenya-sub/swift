//
//  ScheduleViewController.swift
//  Calender
//
//  Created by sakka kenya on 2018/03/26.
//  Copyright © 2018年 sakka kenya. All rights reserved.
//

import UIKit

class ScheduleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backButton = UIButton(frame: CGRect(x: 0,y: 0,width: 100,height:100))
        backButton.setTitle("back！", for: .normal)
        backButton.backgroundColor = UIColor.black
        backButton.addTarget(self, action: #selector(ScheduleViewController.back(_:)), for: .touchUpInside)
        view.addSubview(backButton)
    }
    
    
    @objc func back(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
