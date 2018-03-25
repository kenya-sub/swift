//
//  ScheduleCollectionViewCell.swift
//  Calender
//
//  Created by sakka kenya on 2018/03/25.
//  Copyright © 2018年 sakka kenya. All rights reserved.
//

import UIKit

class ScheduleViewController: UIViewController {
    let titleName: String
    
    init(titleName: String) {
        self.titleName = titleName
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
}
