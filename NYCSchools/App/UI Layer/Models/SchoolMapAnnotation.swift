//
//  SchoolMapAnnotation.swift
//  NYCSchools
//
//  Created by Диана Мишкова on 8.01.24.
//

import Foundation
import MapKit

class SchoolMapAnnotation: NSObject, MKAnnotation {
    var title: String?
    var coordinate: CLLocationCoordinate2D
    var subtitle: String?
    
    init(title: String? = nil, coordinate: CLLocationCoordinate2D, subtitle: String? = nil) {
        self.title = title
        self.coordinate = coordinate
        self.subtitle = subtitle
    }
}
