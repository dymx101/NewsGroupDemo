//
//  DependencyInjector.swift
//  codeChallengeApp
//
//  Created by Yiming Dong on 2019/4/24.
//  Copyright © 2019 Yiming Dong. All rights reserved.
//

import Foundation
import Swinject

class DependencyInjector {
    public static let shared = DependencyInjector()
    
    public func resolve<Service>(_ serviceType: Service.Type) -> Service? {
        return worker.resolve(serviceType)
    }
    
    private init() {setup()}
    private let worker = Container()
    
    private func setup() {
        
        worker.register(PhotoListViewModelProtocol.self) { _ in
            let apiManager = self.resolve(ApiManagerProtocol.self)!
            let databaseManager = self.resolve(DatabaseManagerProtocol.self)!
            return PhotoListViewModel(apiManager: apiManager, databaseManager: databaseManager)
        }
        
        worker.register(PhotoDetailViewModelProtocol.self) { _ in
            PhotoDetailViewModel()
        }
        
        worker.register(PhotoListItemCellViewModelProtocol.self) { _ in
            PhotoListItemCellViewModel()
        }
        
        worker.register(NetworkManagerProtocol.self) { _ in
            NetworkManager.default
        }
        
        worker.register(DatabaseManagerProtocol.self) { _ in
            DatabaseManager.default
        }
        
        worker.register(ApiManagerProtocol.self) { _ in
            let networkManager = self.resolve(NetworkManagerProtocol.self)!
            return ApiManager(networkManager: networkManager)
        }
    }
}
