//
//  CoreDataManager.swift
//  WeatherAccenture
//
//  Created by Shilpa M on 06/02/21.
//

import UIKit
import Foundation
import CoreData

class CoreDataManager  {
  
    //static let, so that sharedManager have same instance and can not be changed
    static let sharedManager = CoreDataManager()
    
    // Prevent clients from creating another instance.
    private init() {}
    
    //Initializing NSPersistentContainer, thus initializing complete core data stack lazily. persistentContainer object will be initialized only when it is needed
    lazy var persistentContainer: NSPersistentContainer = {
        
    let container = NSPersistentContainer(name: "WeatherAccenture")
        
        
    container.loadPersistentStores(completionHandler: { (storeDescription, error) in
          
        if let error = error as NSError? {
            fatalError("Unresolved error \(error), \(error.userInfo)")
          }
        })
        return container
    }()
    
    //Save context method will save our uncommitted changes in core data store
    func saveContext () {
        let context = CoreDataManager.sharedManager.persistentContainer.viewContext
        if context.hasChanges {
          do {
            try context.save()
          } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
          }
        }
    }
    
    func insertWeather(temp: String, timeZone : String, date : String, sunrise: String?, sunset: String?, cloud: String?, humidity: String?, pressure: String?, speed: String?, direction: String?, co: String?, distance: String?)-> Weathers? {
        
        /*.
         Before you can save or retrieve anything from your Core Data store, you first need to get your hands on an NSManagedObjectContext. You can consider a managed object context as an in-memory “scratchpad” for working with managed objects.
         Think of saving a new managed object to Core Data as a two-step process: first, you insert a new managed object into a managed object context; then, after you’re happy with your shiny new managed object, you “commit” the changes in your managed object context to save it to disk.
         */
        let managedContext = CoreDataManager.sharedManager.persistentContainer.viewContext
        
        /*
         An NSEntityDescription object is associated with a specific class instance
         Class
         NSEntityDescription
         A description of an entity in Core Data.
         
         Retrieving an Entity with a Given Name here Weather
         */
        let entity = NSEntityDescription.entity(forEntityName: "Weathers",
                                                in: managedContext)!
        
        /*
         Initializes a managed object and inserts it into the specified managed object context.
         
         init(entity: NSEntityDescription,
         insertInto context: NSManagedObjectContext?)
         */
        let weather = NSManagedObject(entity: entity,
                                     insertInto: managedContext)
        
        /*
         With an NSManagedObject in hand, you set the name attribute using key-value coding. You must spell the KVC key (name in this case) exactly as it appears in your Data Model
         */
        weather.setValue(temp, forKeyPath: "temp")
        weather.setValue(timeZone, forKeyPath: "timeZone")
        weather.setValue(date, forKeyPath: "date")
        weather.setValue(sunrise, forKeyPath: "sunrise")
        weather.setValue(sunset, forKeyPath: "sunset")
        weather.setValue(cloud, forKeyPath: "cloud")
        weather.setValue(humidity, forKeyPath: "humidity")
        weather.setValue(pressure, forKeyPath: "pressure")
        weather.setValue(speed, forKeyPath: "speed")
        weather.setValue(direction, forKeyPath: "direction")
        weather.setValue(co, forKeyPath: "co")
        weather.setValue(distance, forKeyPath: "distance")
        
        /*
         You commit your changes to Weather and save to disk by calling save on the managed object context. Note save can throw an error, which is why you call it using the try keyword within a do-catch block. Finally, insert the new managed object into the people array so it shows up when the table view reloads.
         */
        do {
          try managedContext.save()
          return weather as? Weathers
        } catch let error as NSError {
          print("Could not save. \(error), \(error.userInfo)")
          return nil
        }
    }
    
    func update(temp: Double, timeZone : String, date : String, weather : Weathers) {
        
        /*
         Before you can save or retrieve anything from your Core Data store, you first need to get your hands on an NSManagedObjectContext. You can consider a managed object context as an in-memory “scratchpad” for working with managed objects.
         Think of saving a new managed object to Core Data as a two-step process: first, you insert a new managed object into a managed object context; then, after you’re happy with your shiny new managed object, you “commit” the changes in your managed object context to save it to disk.
         */
        let context = CoreDataManager.sharedManager.persistentContainer.viewContext
        
        do {
          
          
          /*
           With an NSManagedObject in hand, you set the name attribute using key-value coding. You must spell the KVC key (name in this case) exactly as it appears in your Data Model
           */
            weather.setValue(temp, forKey: "temp")
            weather.setValue(timeZone, forKeyPath: "timeZone")
            weather.setValue(date, forKey: "date")
          
          /*
           You commit your changes to Weather and save to disk by calling save on the managed object context. Note save can throw an error, which is why you call it using the try keyword within a do-catch block. Finally, insert the new managed object into the people array so it shows up when the table view reloads.
           */
          do {
            try context.save()
            print("saved!")
          } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
          } catch {
            
          }
          
        } catch {
          print("Error with request: \(error)")
        }
    }
    
    func deleteAllWeather(_ entity: String) {
        /*get reference of managed object context*/
        let managedContext = CoreDataManager.sharedManager.persistentContainer.viewContext
        
        /*init fetch request*/
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: entity)
        //fetchRequest.returnsObjectsAsFaults = false
        let ReqVar = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
            let DelAllReqVar = NSBatchDeleteRequest(fetchRequest: ReqVar)
        do { try managedContext.execute(DelAllReqVar) }
            catch { print(error) }
    }
    
    func fetchAllWeather() -> [Weathers]?{
        
        
        /*Before you can do anything with Core Data, you need a managed object context. */
        let managedContext = CoreDataManager.sharedManager.persistentContainer.viewContext
        
        /*As the name suggests, NSFetchRequest is the class responsible for fetching from Core Data.
         
         Initializing a fetch request with init(entityName:), fetches all objects of a particular entity. This is what you do here to fetch all Weather entities.
         */
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Weathers")
        
        /*Hand the fetch request over to the managed object context to do the heavy lifting. fetch(_:) returns an array of managed objects meeting the criteria specified by the fetch request.*/
        do {
          let people = try managedContext.fetch(fetchRequest)
          return people as? [Weathers]
        } catch let error as NSError {
          print("Could not fetch. \(error), \(error.userInfo)")
          return nil
        }
        
    }
    
    func delete(ssn: String) -> [Weathers]? {
      /*get reference to appdelegate file*/
      
      
      /*get reference of managed object context*/
      let managedContext = CoreDataManager.sharedManager.persistentContainer.viewContext
      
      /*init fetch request*/
      let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Weathers")
      
      /*pass your condition with NSPredicate. We only want to delete those records which match our condition*/
      fetchRequest.predicate = NSPredicate(format: "timeZone == %@" ,ssn)
      do {
        
        /*managedContext.fetch(fetchRequest) will return array of person objects [personObjects]*/
        let item = try managedContext.fetch(fetchRequest)
        var arrRemovedPeople = [Weathers]()
        for i in item {
          
          /*call delete method(aManagedObjectInstance)*/
          /*here i is managed object instance*/
          managedContext.delete(i)
          
          /*finally save the contexts*/
          try managedContext.save()
          
          /*update your array also*/
          arrRemovedPeople.append(i as! Weathers)
        }
        return arrRemovedPeople
        
      } catch let error as NSError {
        print("Could not fetch. \(error), \(error.userInfo)")
    return nil
      }
      
    }
}
