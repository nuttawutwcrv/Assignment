//
//  DatabaseManager.swift
//  Assignment

import Foundation
import CoreData

class DatabaseManager {
    
    private var momdName = "Database"
    private var entyName = "Currency"
    
    static let shared = DatabaseManager()
    
    private lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: momdName)
        container.loadPersistentStores(completionHandler: { _, error in
            _ = error.map { fatalError("Unresolved error \($0)") }
        })
        return container
    }()
    
    private var mainContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    func backgroundContext() -> NSManagedObjectContext {
        return persistentContainer.newBackgroundContext()
    }
    
    
    //MARK: - Function
    
    public func addCurrency(_ currency: CurrencyInfo) {
        
        let context = self.mainContext
        do {
            let entity = NSEntityDescription.entity(forEntityName: entyName, in: context)!
            let insert = NSManagedObject(entity: entity, insertInto: context)
            insert.setValue(currency.date, forKeyPath: "date")
            insert.setValue(currency.code, forKeyPath: "code")
            insert.setValue(currency.name, forKeyPath: "name")
            insert.setValue(currency.rate, forKeyPath: "rate")
            insert.setValue(currency.symbol, forKeyPath: "symbol")
            insert.setValue(currency.rate_float, forKeyPath: "rate_float")
            
            do {
                try context.save()
            }
            catch let error as NSError {
                print("Could not save. \(error), \(error.userInfo)")
            }
        }
    }
    
    public func currencies() -> [CurrencyInfo] {
        
        let context = self.mainContext
        let request = NSFetchRequest<NSManagedObject>(entityName: entyName)
        do {
            let results = try context.fetch(request)
            return results.map { result -> CurrencyInfo in
                let info = CurrencyInfo()
                info.date = (result.value(forKeyPath: "date") as? Date) ?? Date()
                info.code = (result.value(forKeyPath: "code") as? String) ?? ""
                info.name = (result.value(forKeyPath: "name") as? String) ?? ""
                info.rate = (result.value(forKeyPath: "rate") as? String) ?? ""
                info.symbol = (result.value(forKeyPath: "symbol") as? String) ?? ""
                info.rate_float = (result.value(forKeyPath: "rate_float") as? Float) ?? 0
                return info
            }
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
            return []
        }
    }

    public func reset() {
        
        let context = self.mainContext
        let request: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: entyName)
        let removes = NSBatchDeleteRequest(fetchRequest: request)

        do {
            try context.execute(removes)
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
}
