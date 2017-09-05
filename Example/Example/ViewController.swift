//
//  ViewController.swift
//  Example
//
//  Created by zhuxiangpeng on 2017/9/5.
//  Copyright © 2017年 xpz. All rights reserved.
//

import UIKit
import TouchEdgeExtendView

class ViewController: UIViewController {

	@IBOutlet fileprivate weak var button: UIButton!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
		
		//将button的可以点击区域扩大10像素
		button.responseInsets = UIViewEdgeInsetsMake(10, 10, 10, 10)
		
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	@IBAction func buttonClick(sender: Any) {
		print("hello")
	}

}

