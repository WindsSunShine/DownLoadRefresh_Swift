//
//  ViewController.swift
//  DownRefresh_Swift
//
//  Created by 张建军 on 16/9/13.
//  Copyright © 2016年 张建军. All rights reserved.
//

/*
 [使用方法]
 
 1.目前只对UITableviewController有用；
 2.只能下拉刷新，不能上拉刷新；
 3.init或者viewdidload中创建UIRefreshControl，设置文字，颜色等信息；
 4.系统自动管理UIRefreshControl，自动添加到tableview视图中；
 5.给UIRefreshControl添加方法，当值改变的时候调用，方法用于数据请求；
 6.该方法中请求数据确认完成之后，调用endRefreshing方法，关闭刷新；
 
 */


import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    
    let SCEREEN_WIDTH = UIScreen.mainScreen().bounds.size.width
    let SCERRN_HEIGHT = UIScreen.mainScreen().bounds.size.height
    
    let cellIdentifer = "CellID"
    let favoriteEmoji = ["🤗🤗🤗🤗🤗", "😅😅😅😅😅", "😆😆😆😆😆"]
    let newFavoriteEmoji = ["🏃🏃🏃🏃🏃", "💩💩💩💩💩", "👸👸👸👸👸", "🤗🤗🤗🤗🤗", "😅😅😅😅😅", "😆😆😆😆😆" ]
    
    var emojiData = [String]()
    
    var tableViewController = UITableViewController(style:.Plain)
    
    var refreshControl = UIRefreshControl()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
       self.creatTableView()
        
       self.creatRefreshControl()
        
        
    }
    
    // 创建tableView
    
    func creatTableView()  {
        
        let emojiTableView = tableViewController.tableView
        emojiTableView.frame = CGRectMake(0, 64, SCEREEN_WIDTH, SCERRN_HEIGHT)
        
        emojiData = favoriteEmoji
        
        emojiTableView.dataSource = self
        emojiTableView.delegate = self
        emojiTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellIdentifer)
        //自动计算cell的高度估算高度也要写 即：rowHeight跟estimaTEDRowHeight
        
    // 自适应高度的写法
        emojiTableView.rowHeight = UITableViewAutomaticDimension
        emojiTableView.estimatedRowHeight = 60.0
        self.view.addSubview(emojiTableView)
        
        
    }
    
    // 创建刷新的控制器
    func creatRefreshControl()  {
        
        
        tableViewController.refreshControl = self.refreshControl
        
        // 添加刷新完成的控制方法
        self.refreshControl.addTarget(self, action: #selector(ViewController.didRoadEmoji), forControlEvents: .ValueChanged)
        let attributes = [NSForegroundColorAttributeName: UIColor.blackColor()]
        // 设置刷新显示的时间  下拉刷新文字描述 ---- 标题
        self.refreshControl.attributedTitle = NSAttributedString(string: "Last updated on\(NSDate())",attributes: attributes)
        
        // 设置刷新菊花的颜色
        self.refreshControl.tintColor = UIColor.blackColor()
    }
    
    // 1、TableView DataSource
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        print(emojiData.count)
        
        return emojiData.count
        
        
    }
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifer)! as UITableViewCell
        
        cell.textLabel?.text = self.emojiData[indexPath.row]
        
        cell.textLabel?.textAlignment = NSTextAlignment.Center
        
        cell.backgroundColor = UIColor.clearColor()
        
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        
        return cell
        
    }
    
    
    
    
    // 再刷新结束后加载数据，并调用结束刷新的方法
    func didRoadEmoji() {
        
        self.emojiData = newFavoriteEmoji
        
        self.tableViewController.tableView.reloadData()
        
        self.refreshControl.endRefreshing()
        
        
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

