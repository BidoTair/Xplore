//
//  MapViewController.swift
//  Xplore
//
//  Created by Abdulghafar Al Tair on 6/8/16.
//  Copyright © 2016 Abdulghafar Al Tair. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, MKMapViewDelegate {
    
    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var table: UITableView!
    
    var placeList: [Place] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.placeList = Place.placeList()
        self.setupMapView()
        self.setupTableView()
        self.table.allowsMultipleSelectionDuringEditing = false
        
        map.delegate = self
    }
    
    
    func setupTableView() {
        table.delegate = self
        table.dataSource = self
        
        self.table.registerClass(cutomPlaceTableViewCell.self, forCellReuseIdentifier: "cutomPlaceTableViewCell")
    }
    
    func setupMapView() {
        map.mapType = .HybridFlyover
        map.showsBuildings = true
//        for place in placeList {
//            self.map.addAnnotation(place)
//        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
       let pin = MKPinAnnotationView()
        if (annotation as! Place).favorite {
            pin.pinTintColor = UIColor.yellowColor()
        }
        else {
            pin.pinTintColor = UIColor.redColor()
        }
        
        
        return pin
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return placeList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let spot = placeList[indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier("cutomPlaceTableViewCell") as? cutomPlaceTableViewCell
        cell!.cellLabel!.text = spot.title
        cell!.cellImage!.imageFromUrl(spot.logoURL!)
        print(spot.date)
        cell!.cellDate!.text = spot.date
        
    
//        else {
//            cell!.cellLabel.text = spot.title
//            cell?.cellImage.frame = CGRectMake(0, 0, 44, 44)
//            cell!.cellImage.imageFromUrl(spot.logoURL!)
//            cell?.star1.hidden = true
//            cell?.star2.hidden = true
//            cell?.star3.hidden = true
//            cell?.star4.hidden = true
//
//        }
        
        
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let spot = placeList[indexPath.row]
        map.setCenterCoordinate(spot.coordinate, animated: true)
        
        let span = MKCoordinateSpanMake(0.01, 0.01)
        self.map.addAnnotation(spot as MKAnnotation)
        // or use the current map zoom and just center the map
        // let span = mapView.region.span
        
        // now move the map
        let region = MKCoordinateRegion(center: spot.coordinate, span: span)
        map.setRegion(region, animated: true)
        
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
       return CGFloat(88)
    }
    
    // allows user to edit
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .Normal, title: "Delete") { action, index in
            func deleteRow() {
                self.placeList.removeAtIndex(indexPath.row)
                self.table.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
            }
            
            let alert = UIAlertController(title: "Alert", message: "Are you sure you want to delete?", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Yes", style: UIAlertActionStyle.Default, handler: { (alertAction) -> Void in
                deleteRow()
            }))
            
            self.presentViewController(alert, animated: true, completion: nil)
            
//            func deleteRow() {
//                self.placeList.removeAtIndex(indexPath.row)
//                self.table.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
//            }

        }
        delete.backgroundColor = UIColor.redColor()
        
        let favorite = UITableViewRowAction(style: .Normal, title: "Favorite") { action, index in
            self.placeList[indexPath.row].favorite = true
            print(self.placeList[indexPath.row].favorite)
           // tableView.cellForRowAtIndexPath(indexPath)?.textLabel?.textColor = UIColor.yellowColor()
        }
        favorite.backgroundColor = UIColor.orangeColor()
        
        return[delete,favorite]
    }
    
//    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
//        
//        if (editingStyle == UITableViewCellEditingStyle.Delete) {
//            placeList.removeAtIndex(indexPath.row)
//            table.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
//            print("cell deleted")
//        }
//        
//    }
    
}

