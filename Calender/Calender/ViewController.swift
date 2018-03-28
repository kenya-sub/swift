//
//  ViewController.swift
//  Calender
//
//  Created by sakka kenya on 2018/03/07.
//  Copyright © 2018年 sakka kenya. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    private var myCollectView:UICollectionView!
    //セルの余白
    let cellMargin:CGFloat = 2.0
    //１週間に何日あるか(列数)
    let daysPerWeek:Int = 7
    
    let dateManager = DateManager()
    var startDate:Date!
    
    
    //表示する年月のラベル
    private var monthLabel:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let barHeight = UIApplication.shared.statusBarFrame.size.height
        let width = self.view.frame.width
        let height = self.view.frame.height
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsetsMake(0,0,0,0)
        
        //コレクションビューを設置
        myCollectView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        myCollectView.frame = CGRect(x:0,y:barHeight + 50,width:width,height:height - barHeight - 50)
        myCollectView.register(CalendarCell.self, forCellWithReuseIdentifier: "collectCell")
        myCollectView.delegate = self
        myCollectView.dataSource = self
        myCollectView.backgroundColor = .black
        
        self.view.addSubview(myCollectView)
        
        let date = Date()
        var components = NSCalendar.current.dateComponents([.year, .month, .day], from: date)
        components.year = 2018
        components.month = 2
        components.day = 1
        startDate = NSCalendar.current.date(from: components)
        
        
        
        let month:Int = Int(dateManager.monthTag(row:6,startDate:startDate))!
        let digit = numberOfDigit(month: month)
        
        //月情報を取得
        monthLabel = UILabel()
        monthLabel.frame = CGRect(x:0,y:0,width:width,height:100)
        monthLabel.center = CGPoint(x:width / 2,y:50)
        monthLabel.textAlignment = .center
        
        if(digit == 5){
            monthLabel.text = String(month / 10) + "年" + String(month % 10) + "月"
            self.title = String(month / 10) + "年" + String(month % 10) + "月"
        }else if(digit == 6){
            monthLabel.text = String(month / 100) + "年" + String(month % 100) + "月"
            self.title = String(month / 100) + "年" + String(month % 100) + "月"
        }
        self.view.addSubview(monthLabel)
        
        
    }
    
    //セクションの数
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    //レイアウト調整 行間余白
    func collectionView(_ collectionView:UICollectionView,layout collectionViewLayout:UICollectionViewLayout,minimumLineSpacingForSectionAt section:Int) -> CGFloat{
        return cellMargin
    }
    
    //レイアウト調整　列間余白
    func collectionView(_ collectionView:UICollectionView,layout collectionViewLayout:UICollectionViewLayout,minimumInteritemSpacingForSectionAt section:Int) -> CGFloat{
        return cellMargin
    }
    
    
    //セルのサイズを設定
    func collectionView(_ collectionView:UICollectionView,layout collectionViewLayout:UICollectionViewLayout,sizeForItemAt indexPath:IndexPath) -> CGSize{
        let numberOfMargin:CGFloat = 8.0
        let width:CGFloat = (collectionView.frame.size.width - cellMargin * numberOfMargin) / CGFloat(daysPerWeek)
        let height:CGFloat = width * 2.0
        return CGSize(width:width,height:height)
    }
    	
    //セルを選択した時
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let delegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        delegate.scheduleDate = String(indexPath[1] - 3)
        
        let nextVC = ScheduleViewController()
        if (self.navigationController == nil){
            print("Nil")
        }
        self.navigationController?.pushViewController(nextVC, animated: true)
        //let navigation = UINavigationController(rootViewController: nextVC)
        //navigation.isNavigationBarHidden = true
        //self.navigationController?.present(navigation, animated: true, completion: nil)
    }
    
    //セルの総数
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dateManager.cellCount(startDate: startDate)
    }
    
    //セルの設定
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:CalendarCell = collectionView.dequeueReusableCell(withReuseIdentifier:"collectCell",for:indexPath as IndexPath) as! CalendarCell
        
        //土曜ー＞青　日曜ー＞赤
        if(indexPath.row % 7 == 0){
            cell.textLabel.textColor = UIColor.red
        }else if(indexPath.row % 7 == 6){
            cell.textLabel.textColor = UIColor.blue
        }else{
            cell.textLabel.textColor = UIColor.white
        }
        
        //セルの日付を取得
        cell.textLabel.text = dateManager.conversionDateFormat(row: indexPath.row, startDate: startDate)
        
        cell.tag = Int(dateManager.monthTag(row:indexPath.row, startDate:startDate))!
        
        return cell
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let visibleCell = myCollectView.visibleCells.filter{
            return myCollectView.bounds.contains($0.frame)
        }
        
        var visibleCellTag = Array<Int>()
        if(visibleCell != []){
            visibleCellTag = visibleCell.map{$0.tag}
            //月は奇数か偶数か　割り切れるものだけを取り出す
            let even = visibleCellTag.filter{
                return $0 % 2 == 0
            }
            let odd = visibleCellTag.filter{
                return $0 % 2 != 0
            }
            //oddかevenの多い方を返す
            let month = even.count >= odd.count ? even[0] : odd[0]
            
            //桁数によって分岐
            let digit = numberOfDigit(month: month)
            if(digit == 5){
                monthLabel.text = String(month / 10) + "年" + String(month % 10) + "月"
            }else if(digit == 6){
                monthLabel.text = String(month / 100) + "年" + String(month % 100) + "月"
            }
        }
    }
    
    // 桁数を計算
    func numberOfDigit(month:Int) -> Int{
        var num = month
        var cnt = 1
        while(num / 10 != 0){
            cnt = cnt + 1
            num = num / 10
        }
        return cnt
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
