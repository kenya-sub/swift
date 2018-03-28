//
//  ToDoStore.swift
//  Calender
//
//  Created by sakka kenya on 2018/03/28.
//  Copyright © 2018年 sakka kenya. All rights reserved.
//

import UIKit
import CoreData

class ToDoStore: NSManagedObject {
    @NSManaged var memo:String
    @NSManaged var date:Date
}
