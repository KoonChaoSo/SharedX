//
//  LoginViewController.swift
//  SharedX
//
//  Created by ChaoSo on 2016/10/8.
//  Copyright © 2016年 ChaoSo. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    public var index : Int!
    
    @IBOutlet weak var textFieldAccout: UITextField!
    
    @IBOutlet weak var textFieldPassword: UITextField!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onClickLogin(_ sender: AnyObject) {
        let accout : String = (self.textFieldAccout.text)!
        let password : String = self.textFieldPassword.text!
        
        NSLog("account == %@ ,password ==== %@", accout,password)
        let manager = BaseNetworkManager(domain: "https://httpbin.org")
        
        manager.httpGet(path: "/get", params: ["" : "" as AnyObject], successBlk: { statuscode,data in
            print(data)
            }) { (data) in
            print(data)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
