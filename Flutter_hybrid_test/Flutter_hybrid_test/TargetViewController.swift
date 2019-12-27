//
//  TargetViewController.swift
//  Flutter_hybrid_test
//
//  Created by 陈庆 on 2019/12/25.
//  Copyright © 2019 陈庆. All rights reserved.
//

import UIKit
import Flutter
class TargetViewController: UIViewController {

    lazy var button:UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("返回", for: .normal)
        btn.frame=CGRect(x: 0, y: 0, width: 44, height: 44)
        btn.setTitleColor(UIColor.blue, for: .normal)
        btn.addTarget(self, action: #selector(backClick), for: .touchUpInside)
        return btn
    }()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        title = "本地页面"
    }
    @objc fileprivate func backClick(){
        //返回上个界面
        self.navigationController?.popViewController(animated: true)
    }
   func pushFlutterViewController_EventChannel() {
        let flutterViewController = FlutterViewController()
        flutterViewController.setInitialRoute("test")
//        flutterViewController.navigationItem.title="Demo"
        flutterViewController.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
        
        let channelName = "com.pages.your/native_get"
        let messageChannel = FlutterMethodChannel(name: channelName, binaryMessenger: flutterViewController as! FlutterBinaryMessenger)
        self.navigationController?.pushViewController(flutterViewController, animated: true)
    
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        pushFlutterViewController_EventChannel()
    }
}
extension TargetViewController:FlutterStreamHandler{
    // 这个onListen是Flutter端开始监听这个channel时的回调，第二个参数 EventSink是用来传数据的载体。
    func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
        // arguments flutter给native的参数
        // 回调给flutter， 建议使用实例指向，因为该block可以使用多次
        if events != nil {
            events("push传值给flutter的vc")
        }
        NSLog("\(arguments)")
        return nil;
    }
    func onCancel(withArguments arguments: Any?) -> FlutterError? {
        return nil;
    }
}
