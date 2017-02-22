//
//  SearchViewController.swift
//  MatNyttigt
//
//  Created by Erika Linde on 16/02/17.
//  Copyright © 2017 Erika Linde. All rights reserved.
//

import UIKit


class SearchViewController: UIViewController {

    @IBOutlet weak var searchField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func printingMessage(_ sender: UIButton) {
        print("osidogsd")
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tableViewController = segue.destination as! TableViewController
        
        tableViewController.searchWord = searchField.text!
    }
}
