//
//  NewPlaceViewController.swift
//  Xplore
//
//  Created by Abdulghafar Al Tair on 6/14/16.
//  Copyright © 2016 Abdulghafar Al Tair. All rights reserved.
//

import UIKit
import MapKit

class NewPlaceViewController: UIViewController {

    @IBOutlet weak var titleField: UITextField!
    
    @IBOutlet weak var descriptionField: UITextField!
    
    @IBOutlet weak var latField: UITextField!
    
    @IBOutlet weak var longField: UITextField!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backButtonTapped(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func saveButtonTapped(sender: UIButton) {
        let title = titleField.text!
        let description = descriptionField.text!
        let lat = Double(latField.text!)
        let long = Double(longField.text!)
        var coordinate = CLLocationCoordinate2D()
        coordinate.latitude = lat! as CLLocationDegrees
        coordinate.longitude = long! as CLLocationDegrees
    
        if title != "" {
             placesController.sharedInstance.addPlace(coordinate, title: title, date: NSDate(), description: description)
        }
        else {
            print("Place title cannot be empty")
        }
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
