//
//  Scooter.swift
//  Scooter
//
//  Created by Temiloluwa on 18/06/2022.
//

import Foundation
import MapKit

struct Scooter: Identifiable {
    
    enum Speed: String {
        case normal
        case fast
    }
    let id: Int
    let name: String
    let batteryCharge: Int
    let reservationFee: Double
    let costPerMinute: Double
    let speed: Speed
    let location: CLLocationCoordinate2D
    
}

