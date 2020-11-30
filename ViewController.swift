//
//  ViewController.swift
//  MyStopWatch
//
//  Created by zhaoq on 2020/11/28.
//  Copyright © 2020 zhaoq. All rights reserved.
//

import UIKit

//属性监听器。书签205
//计时器。书签204
class ViewController: UIViewController {
//用了自定义的字体之后，显示的秒的字体不会随着分秒字体的大小而变动
    @IBOutlet weak var myPauseBtn: UIButton!
    @IBOutlet weak var myPlayBtn: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var reset: UIButton!
    
    var timer: Timer!
    var counter: CGFloat = 0.0 {
        didSet {
            timeLabel.text = String(format: "%.1f", counter)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reset.isEnabled = false
    }
  
    @IBAction func myreset(_ sender: Any) {
        
        timer.invalidate()
        counter = 0
        myPlayBtn.isEnabled = true
        myPauseBtn.isEnabled = true
    }
    
    @IBAction func myPlay(_ sender: Any) {
       timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        myPlayBtn.isEnabled = false
        myPlayBtn.isEnabled = false
        myPauseBtn.isEnabled = true
        reset.isEnabled = true
    }
    
    @IBAction func myPause(_ sender: Any) {
        //停止计时器
        timer.invalidate()
        myPauseBtn.isEnabled = false
        myPlayBtn.isEnabled = true
        reset.isEnabled = true
    }
    
    @objc func updateTime()->CGFloat {
        counter = counter + 0.1
        return counter
    }
}

