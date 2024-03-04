//
//  SchoolDetailsMapCollectionView.swift
//  NYCSchools
//
//  Created by Диана Мишкова on 8.01.24.
//

import Foundation
import UIKit
import MapKit

class SchoolDetailsMapCollectionViewCell: UICollectionViewCell {
    private var school: School?
    
    private struct Constants {
        static let leftInset: CGFloat = 10
        static let topInset: CGFloat = 10
        static let rightInset: CGFloat = 10
        static let bottomInset: CGFloat = 10
        static let borderWidth: CGFloat = 0.5
        static let cornerRadius: CGFloat = 10.0
        static let wrapperViewInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
    }
    
    private var mapView: MKMapView = {
        let mapView = MKMapView()
        return mapView
    }()
    
    private var currentUserLocationAnnotation: SchoolMapAnnotation? = nil
    
    private var wrapperView: UIView = {
        let view = UIView(forAutoLayout: ())
        view.backgroundColor = .white
        view.layer.borderWidth = Constants.borderWidth
        view.layer.cornerRadius = Constants.cornerRadius
        view.layer.borderColor = UIColor.gray.cgColor
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    private func setupWrapperView() {
        addSubview(wrapperView)
        wrapperView.autoPinEdgesToSuperviewEdges(with: Constants.wrapperViewInsets)
    }
    
    private func setupViews() {
        backgroundColor = .white
        setupWrapperView()
        
        wrapperView.addSubview(mapView)
        mapView.autoPinEdgesToSuperviewEdges()
        mapView.delegate = self
        wrapperView.clipsToBounds = true
        
        NotificationCenter.default.addObserver(self, selector: #selector(listenToUserLocation), name: NSNotification.Name(SchoolDetailsViewController.Constants.locationUpdateNotification), object: nil)
    }
    
    @objc func listenToUserLocation(_ notification: Notification) {
        guard let userCoordinateLocation = notification.userInfo?["userLocation"] as? CLLocation else {
            return
        }
        if currentUserLocationAnnotation == nil {
            currentUserLocationAnnotation = SchoolMapAnnotation(title: "You", coordinate: userCoordinateLocation.coordinate, subtitle: "Current location")
            if let annotation = currentUserLocationAnnotation {
                mapView.addAnnotation(annotation)
            }
        } else {
            currentUserLocationAnnotation?.coordinate = userCoordinateLocation.coordinate
        }
    }
    
    func populate(school: School) {
        self.school = school
        updateMap()
    }
    
    private func updateMap() {
        if let longitude = school?.longitude,
           let longitudeDouble = Double(longitude),
           let latitude = school?.latitude,
           let latitudeDouble = Double(latitude) {
            let coordinates = CLLocationCoordinate2D(latitude: latitudeDouble, longitude: longitudeDouble)
            let annotation = SchoolMapAnnotation(title: school?.schoolName ?? "", coordinate: coordinates, subtitle: school?.primaryAddressLine ?? "")
            mapView.addAnnotation(annotation)
            if let regionMetres = CLLocationDistance(exactly: 300) {
                let region = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionMetres, longitudinalMeters: regionMetres)
                mapView.setRegion(mapView.regionThatFits(region), animated: true)
            }
        }
    }
}


extension SchoolDetailsMapCollectionViewCell: MKMapViewDelegate {
    
}
