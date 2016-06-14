//
//  PlacesController.swift
//  Xplore
//
//  Created by Abdulghafar Al Tair on 6/14/16.
//  Copyright © 2016 Abdulghafar Al Tair. All rights reserved.
//

import Foundation
import MapKit

class placesController {
    
    private var places: [Place] = []
    
    class var sharedInstance: placesController {
        struct Static {
            static var instance:placesController?
            static var token: dispatch_once_t = 0
        }
        
        dispatch_once(&Static.token)    {
            Static.instance = placesController()
        }
        return Static.instance!
    }
    
    
    
    func addPlace(cooridantes: CLLocationCoordinate2D, title: String?, date:NSDate?,description: String?) {
        let place = Place(title: title, description: description, date: date, coordiantes: cooridantes)
        places.append(place)
        
        
        PersistenceManager.saveNSArray(places, fileName: "placesVisited")
        
    }
    
    private func readPlacesFromMemory() {
        let result = PersistenceManager.loadNSArray("placesVisited")
        let places = result as? [Place]
        if places == nil {
            self.places += []
        }
        else {
            self.places += places!
        }
    }
    
    func getPlaces() -> [Place] {
        if (places.isEmpty) {
            self.readPlacesFromMemory()
        }
        
        if (places.isEmpty) {
            return Place.placeList()
        }
        else {
            return places
        }
    }
    
    
    
    
    
}