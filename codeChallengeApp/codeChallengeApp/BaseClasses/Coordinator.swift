//
//  Coordinator.swift
//  codeChallengeApp
//
//  Created by Yiming Dong on 2019/4/24.
//  Copyright © 2019 Yiming Dong. All rights reserved.
//

import UIKit

/// Coordinator protocol for the coordinator architecture
protocol Coordinator {
    func start()
}

extension Coordinator {
    /// Get main storybord instance
    var mainStoryBoard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: nil)
    }
}
