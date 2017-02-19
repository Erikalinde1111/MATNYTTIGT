//
//  TableViewController.swift
//  MatNyttigt
//
//  Created by Erika Linde on 17/02/17.
//  Copyright © 2017 Erika Linde. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "Apa"
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
        
        //skall tydligen hämta texten från senderns cell har dock ingen aning om hur
        var destViewController : DetailViewController = segue.destination as! DetailViewController
        
    }

}
