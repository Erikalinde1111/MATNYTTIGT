//
//  FoodManager.swift
//  MatNyttigt
//
//  Created by Erika Linde on 21/02/17.
//  Copyright © 2017 Erika Linde. All rights reserved.
//

import Foundation

class FoodManager {
    
    var _searchedWord: String?
    //Gör en array med foodobject i
    var foods = [Food]()
    
    var tableviewctrl : TableViewController!
    
    var searchedWord : String {
        get {
            return _searchedWord!
        } set {
            _searchedWord = newValue
            NSLog(_searchedWord!)
        }
    }
    
    var foodsList : [Food] {
        get {
            return foods
        }
    }
    
    //skapa quera mot matapi
    func searchFood() {
        let urlString = "http://www.matapi.se/foodstuff?query=\(_searchedWord!)"
        
        if let safeUrlString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
            let url = URL(string: safeUrlString) {
            
            let request = URLRequest(url: url)
            let task = URLSession.shared.dataTask(with: request) {
                (maybeData: Data?, response: URLResponse?, error: Error?) in
                if let actualData = maybeData {
                    let jsonOptions = JSONSerialization.ReadingOptions()
                    do{
                        if let parsed = try JSONSerialization.jsonObject(with: actualData, options: jsonOptions) as? [[String:Any]] {
                            print(parsed)
                            //nu är parsed en array med dictionarys i
                            //i arrayen skall för varje dic hämta värdet för name och värdet för number för varje array skapas det ett Foodobject med dessa värden som properties
                            
                            //for loop i parsed
                            for a in parsed {
                                let name = a["name"] as? String
                                let num = a["number"] as? Int
                                NSLog("\(num)")
                                let food = Food(nam: name!,num: num!)
                                self.foods.append(food)
                                NSLog("\(self.foods.count)")
                            }
                            
                            self.tableviewctrl.tableView.reloadData()
                            
                        }else {
                            NSLog("Misslyckades med att typomvandla från json")
                        }
                    }
                    catch let parseError {
                        NSLog("Misslyckades med att parse json: \(parseError)")
                    }
                } else {
                    NSLog("Ingen data mottogs")
                }
            }
            task.resume()
        }
            
        else {
            NSLog("Misslyckades med att skapa url")
        }
        
    }
    
}
    

