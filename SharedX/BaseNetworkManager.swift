//
//  BaseNetworkManager.swift
//  SharedX
//
//  Created by ChaoSo on 2016/10/8.
//  Copyright © 2016年 ChaoSo. All rights reserved.
//

import UIKit
import Alamofire


typealias successBlk = (NSInteger,AnyObject) -> ()
typealias failedBlk = (Error) -> ()

protocol NetworkProtocol {
    func networkManagerDidSuccess(_ manager : BaseNetworkManager) -> Void;
    func networkManagerDidFailed(_ manager : BaseNetworkManager) -> Void;
}

class BaseNetworkManager: NSObject {
    
    private var requestDomain : String?
    
    init(domain : String) {
        self.requestDomain = domain
    }
    
    func httpGet(path:String,params:Dictionary<String , AnyObject>,successBlk : @escaping successBlk,failureBlk : failedBlk) -> Void {
        let url : String = self.requestDomain! + path
        Alamofire.request(url).responseData { response in
            switch response.result {
            case .success:
                    successBlk((response.response?.statusCode)!,response.data as AnyObject)
            case .failure(let error):
                print(error)
            }
        }
    }
}



