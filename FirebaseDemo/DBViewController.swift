

//
//  DBViewController.swift
//  FirebaseDemo
//
//  Created by Asif Ikbal on 5/17/17.
//  Copyright © 2017 Asif Ikbal. All rights reserved.
//

import UIKit
import Firebase


class DBViewController: UIViewController {
  
    var dbReferance: FIRDatabaseReference = FIRDatabase.database().reference()
    
    @IBOutlet weak var labelOutlet: UILabel!

    @IBAction func summercAction(_ sender: Any) {
        
        dbReferance.setValue("Summer")
    }
    
    @IBAction func rainyAction(_ sender: Any) {
        
        dbReferance.setValue("Rainy")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        dbReferance.observe(FIRDataEventType.value, with: { (snapshot) in
            
            
            self.labelOutlet.text = snapshot.value as? String
            
        })
    }
    
    deinit {
        dbReferance.removeAllObservers()
        
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
