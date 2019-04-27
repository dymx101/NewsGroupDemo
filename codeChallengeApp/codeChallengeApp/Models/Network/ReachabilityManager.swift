//
//  ReachabilityManager.swift
//  codeChallengeApp
//
//  Created by Yiming Dong on 2019/4/26.
//  Copyright © 2019 Yiming Dong. All rights reserved.
//

import Foundation
import Alamofire

typealias NetworkStatus = NetworkReachabilityManager.NetworkReachabilityStatus

/// Rechability manager observes the network reachability
class ReachabilityManager {
    
    static let shared = ReachabilityManager()
    
    private let reachabilityManager = Alamofire.NetworkReachabilityManager(host: Endpoint.host)
    
    private(set) var status = NetworkStatus.unknown
    
    /// start listening to the network reachability
    ///
    /// - parameter onStatusChange: the handler block when observed a network status change
    func startListening(onStatusChange: @escaping (NetworkStatus) -> Void) {
        
        reachabilityManager?.listener = { [weak self] status in
            guard let `self` = self else {return}
            print("network status change from: \(self.status) -> \(status)")
            
            self.status = status
            
            onStatusChange(status)
        }
        
        reachabilityManager?.startListening()
    }
}

extension NetworkReachabilityManager.NetworkReachabilityStatus {
    var statusString: String {
        switch self {
        case .notReachable:
            return Localized(key: "msg_network_status_not_reachable")
            
        case .unknown :
            return Localized(key: "msg_network_status_unknown")
            
        case .reachable(.ethernetOrWiFi):
            return Localized(key: "msg_network_status_wifi")
            
        case .reachable(.wwan):
            return Localized(key: "msg_network_status_wwan")
        }
    }
}
