//
//  TableViewController.swift
//  MatNyttigt
//
//  Created by Erika Linde on 17/02/17.
//  Copyright © 2017 Erika Linde. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    var searchWord = ""
    var foodManager : FoodManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        foodManager = FoodManager()
        //nedanstående rad kör viewDidLoad igen så att den kör resterande rader
        foodManager.tableviewctrl = self
        foodManager.searchedWord = searchWord
        foodManager.searchFood()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        NSLog("\(foodManager.foods.count) items i listan")
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //return 1
        
        return foodManager.foodsList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = foodManager.foodsList[indexPath.row].name
        //cell.textLabel?.text = "Apa"
        return cell
    }
       // Override to support editing the table view.
   /* override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }*/


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //hämtar texten från senderns cell
        let destViewController : DetailViewController = segue.destination as! DetailViewController
        NSLog("Klickar på ett item i listan")
        //denna metod overridar default segue från knappen
        if let cell = sender as? UITableViewCell {
            destViewController.title = cell.textLabel?.text
            destViewController.listOfViewedFoods = foodManager.foodsList
        }
        
    }

}
