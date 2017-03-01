//
//  ViewController.swift
//  MatNyttigt
//
//  Created by Erika Linde on 14/02/17.
//  Copyright © 2017 Erika Linde. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var onion: UIImageView!
    @IBOutlet weak var varmkorv: UIImageView!
    var dynamicAnimator : UIDynamicAnimator!
    var gravity : UIGravityBehavior!
    var collision : UICollisionBehavior!
    var snap : UISnapBehavior!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        onion.alpha = 0
        dynamicAnimator = UIDynamicAnimator(referenceView: view)
        gravity = UIGravityBehavior(items:[varmkorv])
        
        dynamicAnimator.addBehavior(gravity)
        collision = UICollisionBehavior(items: [varmkorv])
        collision.translatesReferenceBoundsIntoBoundary = true
        dynamicAnimator.addBehavior(collision)
        snap = UISnapBehavior(item: varmkorv,snapTo: view.center)
        snap.damping = 5
        dynamicAnimator.addBehavior(snap)
        
        Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { (timer) in
            self.onion.alpha = 1
            self.moveOnion()
        }
    }

    func moveOnion() {
        
        UIView.beginAnimations("Flytta lökringar", context: nil)
        UIView.setAnimationDuration(0.5)
        UIView.setAnimationCurve(.easeOut)
        onion.center = self.varmkorv.center
        UIView.commitAnimations()
    }

}

