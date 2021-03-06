//
//  IOC.swift
//  LifeTimer
//
//  Created by Alexander Skorulis on 5/12/2021.
//

import Swinject
import SwinjectAutoregistration
import CoreData

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
        container.autoregister(ActivityProcessor.self, initializer: ActivityProcessor.init)
    }
    
    private func setupAccess() {
        if testing {
            container.autoregister(PersistenceService.self, initializer: PersistenceService.previews)
                .inObjectScope(.container)
        } else {
            container.autoregister(PersistenceService.self, initializer: PersistenceService.database)
                .inObjectScope(.container)
        }
    }
    
    private func setupCoordinators() {
        
    }
    
    private func setupServices() {
        container.autoregister(ErrorService.self, initializer: ErrorService.init)
    }
    
    private func setupViewModels() {
        container.autoregister(DayViewModel.self, argument: DayViewModel.SelectionType.self, initializer: DayViewModel.init)
        container.autoregister(LabelListViewModel.self, initializer: LabelListViewModel.init)
        container.autoregister(LabelEditViewModel.self, argument: ContextObject<LifeLabel>.self, initializer: LabelEditViewModel.init)
        
        container.autoregister(ActivityViewModel.self, initializer: ActivityViewModel.init)
        container.autoregister(ActivityEditViewModel.self, argument: ContextObject<LifeActivity>.self, initializer: ActivityEditViewModel.init)
    }
    
    func resolve<ServiceType>(_ type: ServiceType.Type) -> ServiceType? {
        return container.resolve(type)
    }
    
    var factory: GenericFactory {
        return resolve(GenericFactory.self)!
    }
}

