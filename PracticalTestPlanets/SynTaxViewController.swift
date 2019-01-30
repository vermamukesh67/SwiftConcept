//
//  SynTaxViewController.swift
//  PracticalTestPlanets
//
//  Created by Verma Mukesh on 15/01/19.
//  Copyright © 2019 Mukesh Verma. All rights reserved.
//

import UIKit

struct Planett
{
    let name:String
    let distanceFromSun: Double
}

extension Array {
    
        func mapUsingReduce<OutElement>(_ closure: (_ item: Iterator.Element) -> OutElement) -> [OutElement]
        {
            return self.reduce([]) { (partial, item) in
                return partial + [closure(item)]
        }
        
    }
}


class Seat
{
  weak var flight : Flight?
    
    init(flight:Flight) {
        self.flight = flight
    }
    
}
class Flight
{
    lazy var seat : Seat = Seat(flight: self)
    init() {
        
    }
}

protocol addableProtocol
{
    static func + (lhs:Self, rhs:Self) -> Self
}

extension String:addableProtocol
{
    
}

extension Int:addableProtocol
{
    
}

extension Double:addableProtocol
{
    
}

class SynTaxViewController: UIViewController {
    
    // global datatype
    var globalInt = 10
    var globalStr = "Varma Mukesh"
    
    var computedPropertyAsObserver : (Int) = 0
    {
        willSet(newValue) {
           // print("new value = \(computedPropertyAsObserver)")
           // print("new value = \(newValue)")
        }
        
        didSet {
           // print("new value = \(computedPropertyAsObserver)")
        }
    }
    
    var arrWeekdays = ["Sunday","monday","Tuesday"]
    
    subscript (index : Int) -> String
    {
        get {
            
            return arrWeekdays.last ?? "No value"
        }
        
        set(newValue)
        {
            arrWeekdays.append(newValue)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
         print("coder")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
         print("awakeFromNib")
    }
    
    override func loadView() {
        super.loadView()
        print("loadView")
    }
    
    override func loadViewIfNeeded() {
        super.loadViewIfNeeded()
        print("loadViewIfNeeded")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear")
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("viewDidLayoutSubviews")
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("viewWillLayoutSubviews")
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        let planets = [
            
            Planett(name: "Mars", distanceFromSun: 1.52),
            Planett(name: "Jupitor", distanceFromSun: 3.20),
            Planett(name: "Saturn", distanceFromSun: 9.38),
            Planett(name: "Neptune", distanceFromSun: 0.1)
        ]
        
     let testArray = planets.mapUsingReduce { (item) -> Planett in
            print(item)
            return item
        }
        
        let result1 = planets.reduce(0) {
              $0 + $1.distanceFromSun
        }
        
        let result2 = planets.map{
            $0.name
        }
        
        //print("result1 = \(result1)")
       // print("result1 = \(result2)")

        // Do any additional setup after loading the view.
        
        //print("global int = \(globalInt)")
       // print("global string = \(globalStr) ")
        
        printMyAgeValue()
        printMyName(myName: "Hello")
        printMyAddress()
        printVagitablsName()
        printTouple()
        printYourBioData()
        printColorsUsingSwitch(caseValue: "y")
        printComputedPropertyValue()
        printValueUsingSubscript()
        printWholeName(firstName: nil, lastName: "Mukesh")
    }
    
    deinit
    {
       // print("controller is not available")
    }
    
    func AddTwoObjects<T:addableProtocol>(first : T , second: T) -> T
    {
        let finalString = first + second
       // print("Final string after append is = \(finalString)")
        return finalString
    }
    
    // MARK: - Function
    
    func printMyAgeValue()
    {
        let myAge = "2s7"
        let intAge = Int(myAge)
        if let age = intAge
        {
          // print("my age = \(age)")
        }
        else
        {
          // print("my age = \(String(describing: intAge))")
        }
        
        guard let age1 = intAge else {
          //  print("age not available")
            return
        }
        
      //  print("my age using guard = \(age1)")
        
    }
    
   
    func printMyName(myName : String)
    {
        //print("My name is \(myName)")
    }
    
    func printMyAddress()
    {
        let myAddress = """
        C/601, 6th floor,\
        Saral Dreamz, Flora Hotel\
        Vastral- 382418, Ahmedabad
        """
       //print(myAddress)
    }
    
    func printFullName(firstName: String, lastName: String) -> String
    {
        let fullName = firstName + " " + lastName
        return fullName
    }
    func printFullName(firstName: Int, lastName: String) -> String
    { // overloading concept : same name with paramter type is diff
        let fullName = "" + lastName
        return fullName
    }
    func printFullName(firstName: String, lastName: String, gender: String) -> String // overloading concept : same name with number of paramter is diff parameters
    {
        let fullName = firstName + "" + lastName
        return fullName
    }
    
    func printWholeName(firstName: String?, lastName: String?) -> String?
    {
        if let fNamee = firstName, let lName = lastName
        {
            return "A"//"Nice to meet you mr \(fNamee) \(lName)"
        }
        if let fName = firstName
        {
            return "B"//"Hi \(fName)"
        }
        if let lName = lastName
        {
            return "C"//"Hello Mr \(lName)"
        }
        return nil
    }
    
    func checkMyAgeIsBelow30() -> Int
    {
        return 30
    }
    func printMyNameFromBidData(diccBioData : [String : String]) -> Bool
    {
        return (diccBioData["name"] != nil) ? true : false
    }
    
    func printVagitablsName() // Array
    {
        var arrVagitables = ["Patato", "Ladies finger", "Cocumber"]
       // print("all vegitables are = \(arrVagitables)")
        
        arrVagitables[1] = "Bringle"
       // print("all vegitables are = \(arrVagitables)")
        
        arrVagitables.remove(at: 0)
        
        // print("all vegitables are = \(arrVagitables)")
        
        arrVagitables.append("Carrot")
        
        //print("all vegitables are = \(arrVagitables)")
        
        arrVagitables.insert("Bitt", at: 1)
        
       // print("all vegitables are = \(arrVagitables)")
        
        for strVag in arrVagitables
        {
           // print(strVag)
        }
        
        for (index, strVag) in arrVagitables.enumerated()
        {
            //print("vegitable at \(index) is \(strVag)")
        }
        
        for index in 0...arrVagitables.count-1
        {
           // print(arrVagitables[index])
        }
        
    }
    
    func printTouple()
    {
        let touple = (name : "Varma Mukesh", age:27)
        
       // print(touple.name)
       // print(touple.1)
    }
    
    func printYourBioData()
    {
        var objDicc = ["firstName":"Mukesh", "lastName":"Varma"]
        
        //print(objDicc["firstName"] ?? "No Value")
        
        objDicc.updateValue("Male", forKey: "gender")
        
       // print(objDicc.debugDescription)
        
        objDicc.removeValue(forKey: "firstName")
    }
    
    func printColorsUsingSwitch(caseValue : String)    {
        
        switch (caseValue)
        {
            case "y":
          //  print("Yello")
            fallthrough
            
            case "r":
           // print("red")
            break
            
            case "b":
           // print("blue")
            break
            
            default :
            print("No colors")
        }
    }
    
    func printComputedPropertyValue()
    {
        var arrWeekdays = ["Sunday","monday","Tuesday"]

        var computedMiddle: (String) {
            
           // return arrWeekdays[arrWeekdays.count/2] // its also valid
            
            get {
                return arrWeekdays[arrWeekdays.count/2]
            }

            set (newValue)
            {
                arrWeekdays[arrWeekdays.count/2] = newValue
            }

        }
        
        //print(computedMiddle)
        
       
        
        computedPropertyAsObserver = 10
    }
    func printValueUsingSubscript()
    {
       // print(self[0])
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
   

}




