//
//  ViewController.swift
//  PracticalTestPlanets
//
//  Created by Mukesh Verma on 20/12/18.
//  Copyright © 2018 Mukesh Verma. All rights reserved.
//

import UIKit



class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    // MARK: Properties
    @IBOutlet weak var actView: UIActivityIndicatorView!
    @IBOutlet weak var tblPlanets: UITableView!
    var arrPlanets = [PlanetData]() // Holds the PlanetData NSManagedObjectModel
    
    
    // MARK: View lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // fetch the data from dataabse if already exists in database
        let objPlanetData = PlanetData()
        arrPlanets = objPlanetData.fetchAllPlanetData(UIApplication.shared.delegate as! AppDelegate) ?? [PlanetData]()
        fetchPlanetData()
    }
    
    // MARK: Api Handling Method
    
    @objc func refreshData(_ id : Any) {
        
        fetchPlanetData()
    }
    
    func fetchPlanetData() {
        // first check for internet connection
        if Reachability.isConnectedToNetwork(){
            self.actView.startAnimating()
            print("Internet Connection Available!")
            let apiManager  = ApiManager()
            apiManager.makeGetRestApiRequest("https://swapi.co/api/planets") { (planetModel , error ) -> (Void) in
                
                DispatchQueue.main.async {
                    
                    self.actView.stopAnimating()
                    
                    // first check for error if any
                    if let objError = error
                    {
                        switch objError {
                        case ApiErrors.dataNotFound:
                            print("Handle No Data found")
                        case ApiErrors.invalidResponse:
                            print("Handle invalid response")
                        case ApiErrors.unsuppotedURL:
                            print("Handle No Data found")
                        }
                    }
                    else
                    {
                        guard let arrPlanetData = planetModel?.results else
                        {
                            print("No Data found")
                            return
                        }
                        self.arrPlanets.removeAll()
                        for (index, item) in  arrPlanetData.enumerated(){
                            
                            print("Found \(item) at position \(index)")
                            let objData = PlanetData()
                            
                            if let hasData = objData.SavePlanetData(item, UIApplication.shared.delegate as! AppDelegate)
                            {
                                self.arrPlanets.append(hasData)
                            }
                        }
                        self.tblPlanets.reloadData()
                        
                    }
                }
            }
        }
        else{
            // Display Alert for no internet connection
            let alertController = UIAlertController(title: "Alert", message: "Internet Connection not available!", preferredStyle: .alert)
            let action1 = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction) in
                
            }
            alertController.addAction(action1)
            self.present(alertController, animated: true, completion: nil)
            
            // Adding right bar button to refresh the content
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(refreshData))
            
        }
    }
    
    // MARK: UITableView DataSource Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrPlanets.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let PlanetData = arrPlanets[indexPath.row]
        
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "planetCellId") as! UITableViewCell
        cell.textLabel?.text = PlanetData.planetName
        cell.detailTextLabel?.text = PlanetData.planetterrain
        return cell;
    }
}

extension ViewController
{
    // datatypes
    
    
    
}

