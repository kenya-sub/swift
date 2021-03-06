//
//  CalendarCell.swift
//  Calender
//
//  Created by sakka kenya on 2018/03/19.
//  Copyright © 2018年 sakka kenya. All rights reserved.
//

import UIKit

class CalendarCell: UICollectionViewCell {
    public var textLabel:UILabel!
    
    required init(coder aDecoder:NSCoder){
        super.init(coder: aDecoder)!
    }
    
    override init(frame:CGRect){
        super.init(frame:frame)
        
        //UILabelを生成
        textLabel = UILabel()
        textLabel.frame = CGRect(x:0,y:0,width:self.frame.width,height:self.frame.height)
        textLabel.textAlignment = .center
        self.contentView.addSubview(textLabel!)
        
    }
}
