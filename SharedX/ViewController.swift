//
//  ViewController.swift
//  SharedX
//
//  Created by ChaoSo on 2016/10/7.
//  Copyright © 2016年 ChaoSo. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let loginViewController = LoginViewController(nibName: "LoginViewController", bundle: nil)
        loginViewController.index = 1
        self.navigationController?.pushViewController(loginViewController, animated: false);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

