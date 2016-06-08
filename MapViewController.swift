//
//  MapViewController.swift
//  Xplore
//
//  Created by Abdulghafar Al Tair on 6/8/16.
//  Copyright © 2016 Abdulghafar Al Tair. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var table: UITableView!
    
    var placeList: [Place] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.placeList = Place.placeList()
        self.setupMapView()
        self.setupTableView()
    }
    
    
    func setupTableView() {
        table.delegate = self
        table.dataSource = self
        
        let cptViewCell: UINib = UINib(nibName: "cutomPlaceTableViewCell", bundle: nil)
        table.registerNib(cptViewCell, forCellReuseIdentifier: "cutomPlaceTableViewCell")
    }
    
    func setupMapView() {
        map.mapType = .HybridFlyover
        for place in placeList {
            self.map.addAnnotation(place)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return placeList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let spot = placeList[indexPath.row]
        
                let cell = tableView.dequeueReusableCellWithIdentifier("cutomPlaceTableViewCell")
                if (cell == nil) {
                     
                
        
                }
        
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let spot = placeList[indexPath.row]
        map.setCenterCoordinate(spot.coordinate, animated: true)
        
        let span = MKCoordinateSpanMake(0.01, 0.01)
        
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
    
    
}

