//
//  AccountApiManager.swift
//  SharedX
//
//  Created by ChaoSo on 2016/10/10.
//  Copyright © 2016年 ChaoSo. All rights reserved.
//

import UIKit

class AccountApiManager: BaseNetworkManager {
    func accountLogin(username : String , password : String) -> Void {
        self.httpGet(path: "account/login", params: ["username" : username , "passwor" : password]);
    
    }
}
