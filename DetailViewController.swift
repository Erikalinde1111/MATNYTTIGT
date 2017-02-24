//
//  DetailViewController.swift
//  MatNyttigt
//
//  Created by Erika Linde on 19/02/17.
//  Copyright © 2017 Erika Linde. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var nutrition1: UILabel!
    @IBOutlet weak var nutrition2: UILabel!
    @IBOutlet weak var nutrition3: UILabel!
    @IBOutlet weak var nutrition4: UILabel!
    @IBOutlet weak var nutrition5: UILabel!
    
    var listOfViewedFoods : [Food]!
    var num : Int!
    var foodManager : FoodManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSLog("\(listOfViewedFoods.count)")
        matchTitleWithFood()
        foodManager = FoodManager()
        foodManager.detailViewctrl = self
        foodManager.searchNutrition(n: num)
        
        // Do any additional setup after loading the view.
    }

    func refreshProperties(){
        DispatchQueue.main.async {
            self.nutrition1.text = "\(self.foodManager.vitaminC!)"
            self.nutrition2.text = "\(self.foodManager.magnesium!)"
            self.nutrition3.text = "\(self.foodManager.vitaminD!)"
            self.nutrition4.text = "\(self.foodManager.zink!)"
            self.nutrition5.text = "\(self.foodManager.salt!)"
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Använd num för en till query från FoodManager
    func matchTitleWithFood(){
        for f in listOfViewedFoods {
            if f.name == self.title {
                num = f.number
            }
        }
        NSLog("\(num)")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
