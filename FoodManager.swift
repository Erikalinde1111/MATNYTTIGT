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
    
    var vitaminC : Int?
    var magnesium : Int?
    var vitaminD : Float?
    var zink : Float?
    var salt : Float?
    
    var tableviewctrl : TableViewController!
    var detailViewctrl : DetailViewController!
    
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
                                NSLog("\(num) och \(name)")
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
    
    
    
    func searchNutrition(n: Int) {
        let urlString = "http://www.matapi.se/foodstuff/\(n)"
        
        if let safeUrlString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
            let url = URL(string: safeUrlString) {
            
            let request = URLRequest(url: url)
            
            let task = URLSession.shared.dataTask(with: request) {
                (maybeData: Data?, response: URLResponse?, error: Error?) in
                if let actualData = maybeData {
                    let jsonOptions = JSONSerialization.ReadingOptions()
                    do{
                        if let parsed = try JSONSerialization.jsonObject(with: actualData, options: jsonOptions) as? [String:Any] {
                            print(parsed)
                            //parsed är nu dictionary där nyckeln är sträng o värdet är any
                            //hämta värdet för nutrientientValues blir dictionary
                            let nutrientValues = parsed["nutrientValues"] as? [String:Any]
                            //nutrientValues är en dictionary med Sting som nyckel och float eller int som värde
                            NSLog("\(nutrientValues)")
                            self.vitaminC = nutrientValues?["vitaminC"] as? Int
                            NSLog("\(self.vitaminC)")
                            self.magnesium = nutrientValues?["magnesium"] as? Int
                            self.vitaminD = nutrientValues?["vitaminD"] as? Float
                            self.zink = nutrientValues?["zink"] as? Float
                            self.salt = nutrientValues?["salt"] as? Float
                            
                            self.detailViewctrl.refreshProperties()
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
    

