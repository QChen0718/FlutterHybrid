//
//  ViewController.swift
//  Flutter_hybrid_test
//
//  Created by 陈庆 on 2019/12/22.
//  Copyright © 2019 陈庆. All rights reserved.
//

import UIKit
import Flutter
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "首页"
    }

    @IBAction func btnClick(_ sender: Any) {
        let vc = FlutterViewController();
        vc.setInitialRoute("myApp")
        vc.navigationItem.title = "flutter页面"
        let channelName = "com.pages.your/native_get"
        let messageChannel = FlutterMethodChannel(name: channelName, binaryMessenger: vc as! FlutterBinaryMessenger)
        messageChannel.setMethodCallHandler { (call, result) in
            //flutter点击事件执行后在iOS跳转TargetViewController
            if call.method == "iOSFlutter"{
                self.navigationController?.pushViewController(TargetViewController(), animated: true)
            }
            // flutter传参给iOS
            if call.method == "iOSFlutter1"{
                let dict:[String:Any] = call.arguments as! [String : Any]
//                let code = dict["code"];
                let data = dict["data"] as! [Int];
                NSLog("\(data)")
            }
            if call.method == "iOSFlutter2" {
                result("返回给flutter的内容");
            }
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
