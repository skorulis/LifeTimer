//
//  IOC.swift
//  LifeTimer
//
//  Created by Alexander Skorulis on 5/12/2021.
//

import Swinject
import SwinjectAutoregistration

public final class IOC {
    
    static let shared: IOC = IOC(testing: false)
    public let container: Container
    private let testing: Bool
    
    public init(testing: Bool) {
        self.testing = testing
        container = Container()
        setupCoordinators()
        setupFactories()
        setupServices()
        setupViewModels()
        setupProcessors()
        setupAccess()
    }
    
    private func setupFactories() {
        container.register(GenericFactory.self) { (_) -> GenericFactory in
            return GenericFactory(container: self.container)
        }
        .inObjectScope(.container)
    }
    
    private func setupProcessors() {
        
    }
    
    private func setupAccess() {
        if testing {
            container.autoregister(PersistenceController.self, initializer: PersistenceController.previews)
                .inObjectScope(.container)
        } else {
            container.autoregister(PersistenceController.self, initializer: PersistenceController.database)
                .inObjectScope(.container)
        }
        
    }
    
    private func setupCoordinators() {
        
    }
    
    private func setupServices() {
    
    }
    
    private func setupViewModels() {
        
    }
    
    func resolve<ServiceType>(_ type: ServiceType.Type) -> ServiceType? {
        return container.resolve(type)
    }
    
    var factory: GenericFactory {
        return resolve(GenericFactory.self)!
    }
}

