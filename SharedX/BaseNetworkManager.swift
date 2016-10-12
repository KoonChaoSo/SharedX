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

protocol NetworkProtocol : NSObjectProtocol{
    
    func networkManagerDidSuccess(_ manager : BaseNetworkManager) -> Void;
    func networkManagerDidFailed(_ error : Error) -> Void;
}

class BaseNetworkManager: NSObject {
    
    private var requestDomain : String?
    weak var delegate : NetworkProtocol?
    private var headers : Dictionary<String, String>?
    
    init(domain : String,token : String) {
        self.requestDomain = domain
        self.headers = [
            "k-team-user-token": token
        ]
    }
    
    func httpGet(path:String,params:Dictionary<String , AnyObject>) -> Void {
        let url : String = self.requestDomain! + path
        Alamofire.request(url, method : .get , headers : self.headers)
            .validate()
            .responseJSON { response in
            switch response.result {
            case .success:
                    if (self.delegate?.responds(to: Selector(("networkManagerDidSuccess:"))))!
                    {
                        self.delegate?.networkManagerDidSuccess(self);
                    }
            case .failure(let error):
                if (self.delegate?.responds(to: Selector(("networkManagerDidFailed:"))))!
                {
                    self.delegate?.networkManagerDidFailed(error);
                }
            }
        }
    }
    
    func httpPost(path:String,params:Dictionary<String , AnyObject>) -> Void {
        let url : String = self.requestDomain! + path
        Alamofire.request(url, method : .post , headers : self.headers)
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success:
                    if (self.delegate?.responds(to: Selector(("networkManagerDidSuccess:"))))!
                    {
                        self.delegate?.networkManagerDidSuccess(self);
                    }
                case .failure(let error):
                    if (self.delegate?.responds(to: Selector(("networkManagerDidFailed:"))))!
                    {
                        self.delegate?.networkManagerDidFailed(error);
                    }
                }
        }
    }
    
    
}



