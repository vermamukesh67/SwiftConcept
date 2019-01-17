//
//  PlanetData+CoreDataProperties.swift
//  PracticalTestPlanets
//
//  Created by Mukesh Verma on 20/12/18.
//  Copyright © 2018 Mukesh Verma. All rights reserved.
//
//

import Foundation
import CoreData


extension PlanetData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PlanetData> {
        return NSFetchRequest<PlanetData>(entityName: "PlanetData")
    }
    // MARK: Properties
    @NSManaged public var planetName: String?
    @NSManaged public var planetterrain: String?

    // MARK: Coredata Insert, Update , Fetch methods
    
    /*
     This function is responsible for insert and update. First it check the same record by using planet name as unique value , if record exist then it update the existing record otherwise insert the planet data (objPlanet) into database
     Returns the PlanetData after inserting or updating
    */
    func SavePlanetData(_ objPlanet: Results,_ appDelegate : AppDelegate) -> PlanetData? {
        
        if let name = objPlanet.name {
            
            // access managedcontent instance
            let managedContext =
                appDelegate.persistentContainer.viewContext
            // Check data already exist in database
            let objPlanetData = fetchPlanetDataByName(name, appDelegate)
            
            if let data = objPlanetData{
                
                // updating the data
                
                data.setValue(objPlanet.name, forKeyPath: "planetName")
                data.setValue(objPlanet.terrain, forKeyPath: "planetterrain")
                
                // 4
                do {
                    try managedContext.save()
                    return data
                    
                } catch let error as NSError {
                    print("Could not save. \(error), \(error.userInfo)")
                }
            }
            else
            {
                // inserting the data
                let entity =
                    NSEntityDescription.entity(forEntityName: "PlanetData",
                                               in: managedContext)!
                
                let planet = NSManagedObject(entity: entity,
                                             insertInto: managedContext)
                planet.setValue(objPlanet.name, forKeyPath: "planetName")
                planet.setValue(objPlanet.terrain, forKeyPath: "planetterrain")
                // 4
                do {
                    try managedContext.save()
                    return planet as? PlanetData
                    
                } catch let error as NSError {
                    print("Could not save. \(error), \(error.userInfo)")
                }
            }
        }
        
        return nil
    }
    
    /*
     This function is responsible for fetching the unique record by considering planet name (strPlanetName) as unique key
     Returns the PlanetData if found
     */
    func fetchPlanetDataByName(_ strPlanetName:String,_ appDelegate : AppDelegate) -> PlanetData? {
        
        // access managedcontent instance
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        // create the fetch request
        let fetchRequest =
            NSFetchRequest<NSManagedObject>(entityName: "PlanetData")
        
        // fetch unique record using predicate
        
        fetchRequest.predicate = NSPredicate(format: "planetName == %@", strPlanetName)

        // execute the fetch request
        do {
          let  arrObjPlanet = try managedContext.fetch(fetchRequest)
            if arrObjPlanet.count>0 {
                let objPlanet = arrObjPlanet.first
                
                return objPlanet as? PlanetData
            }
            else
            {
                return nil;
            }
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        return nil;
    }
    
    /*
     This function is responsible for fetching all the data
     return the array of PlanetData
     */
    func fetchAllPlanetData(_ appDelegate : AppDelegate) -> [PlanetData]? {
        // access managedcontent instance
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        // create the fetch request
        let fetchRequest =
            NSFetchRequest<NSManagedObject>(entityName: "PlanetData")
        
        // excute the fetch request and return the data
        do {
            let  arrPlanets = try managedContext.fetch(fetchRequest)
            return arrPlanets as? [PlanetData]
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
        return nil;
    }
    
}
