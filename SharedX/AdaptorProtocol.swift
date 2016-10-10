//
//  AdaptorProtocol.swift
//  SharedX
//
//  Created by ChaoSo on 2016/10/10.
//  Copyright © 2016年 ChaoSo. All rights reserved.
//

import Foundation

protocol AdaptorProtocol {
    func reformDataWithManager(_ manager : BaseNetworkManager) -> NSDictionary;
}
