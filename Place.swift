//
//  Place.swift
//  Xplore
//
//  Created by Abdulghafar Al Tair on 6/8/16.
//  Copyright © 2016 Abdulghafar Al Tair. All rights reserved.
//


// Description:
import Foundation
import MapKit



class Place:NSObject, MKAnnotation  {
    
    var coordinate: CLLocationCoordinate2D = CLLocationCoordinate2D()
    var title: String? = ""
    var logoURL:String?
    var ratable:Bool = true
    var descriptionField: String?
    var date: String?
    var dateFormatter = NSDateFormatter()
    var favorite: Bool = false
    
    
    class func placeList() -> [Place] {
        
        let place = Place ()
        place.title = "Workshop 17"
        place.logoURL = "https://avatars1.githubusercontent.com/u/7220596?v=3&s=200"
        place.coordinate = CLLocationCoordinate2D(latitude: -33.906764,longitude: 18.4164983)
        place.ratable = true
        place.favorite = true
        place.dateFormatter.dateFormat = "MM/dd/yyyy HH:mm"
        place.date = place.dateFormatter.stringFromDate(NSDate())
        
        
        let place2 = Place ()
        place2.title = "Truth Coffee"
        place2.ratable = false
        place2.logoURL = "https://robohash.org/123.png"
        place2.coordinate = CLLocationCoordinate2D(latitude: -33.9281976,longitude: 18.4227045)
        
        
        let place3 = Place ()
        place3.title = "Chop Chop Coffee"
        place3.ratable = true
        place3.logoURL = "https://cdn3.ixperience.co.za/assets/icons/interview-step-2-801f63110f89e85e38f27d39f5864a1399f256fe0684844caea2a18c4b6fbd33.svg"
        place3.coordinate = CLLocationCoordinate2D(latitude: -33.9271879,longitude: 18.4327055)
        
        
        let place4 = Place ()
        place4.title = "Lion's head"
        place4.ratable = true
        place4.logoURL = "https://image.shutterstock.com/z/stock-vector-a-lion-head-logo-this-is-vector-illustration-ideal-for-a-mascot-and-tattoo-or-t-shirt-graphic-123767464.jpg"
        place4.coordinate = CLLocationCoordinate2D(latitude: -33.934722,longitude: 18.389167)
        
        let place5 = Place ()
        place5.title = "Princeton University"
        place5.ratable = true
        place5.favorite = true
        place5.logoURL = "https://upload.wikimedia.org/wikipedia/en/7/71/Princeton_shield.svg"
        place5.coordinate = CLLocationCoordinate2D(latitude: 40.343,longitude: -74.657)
        
        let place6 = Place ()
        place6.title = "Damascus"
        place6.ratable = true
        place6.favorite = true
        place6.logoURL = "https://upload.wikimedia.org/wikipedia/en/7/71/Princeton_shield.svg"
        place6.coordinate = CLLocationCoordinate2D(latitude: 33.513056,longitude: 36.291944)

        
        
        
        return [place,place2, place3, place4, place5, place6]
    }
    
    class func aPlace () -> Place {
        
        let place = Place ()
        place.title = "Workshop 17"
        place.coordinate = CLLocationCoordinate2D(latitude: -33.906764,longitude: 18.4164983)
        return place
    }
    
}

//let mapCenterCoordinateAfterMove = CLLocationCoordinate2D(latitude: self.PlaceList[indexPath.row].coordinate.latitude,longitude: self.PlaceList[indexPath.row].coordinate.longitude)
//        let adjustedRegion = mapView.regionThatFits(MKCoordinateRegionMake(mapCenterCoordinateAfterMove,
//MKCoordinateSpanMake(0.01, 0.01)))
//        mapView.setRegion(adjustedRegion, animated: true)

//extension UIImageView   {
//    
//    
//    public func imageFromUrl(urlString: String) {
//        if let url = NSURL(string: urlString) {
//            let request = NSURLRequest(URL: url)
//            NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) {
//                (response: NSURLResponse?, data: NSData?, error: NSError?) -> Void in
//                if let imageData = data as NSData? {
//                    self.image = UIImage(data: imageData)
//                }
//            }
//        }
//    }
//    
//}