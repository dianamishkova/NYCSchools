//
//  SchoolDetailsViewController.swift
//  NYCSchools
//
//  Created by Диана Мишкова on 6.01.24.
//

import Foundation
import PureLayout
import UIKit
import CoreLocation

class SchoolDetailsViewController: UIViewController {
    private var sectionsList: [String] = ["school.details.section".localized(), 
                                          "school.sat.section".localized(),
                                          "school.details.map.section".localized()]
    private var collectionView: UICollectionView?
    private var locationManager = CLLocationManager()
    
    var viewModel: SchoolDetailsViewModel?
    
    struct Constants{
        static let schoolDetailsCellIdentifier = "schoolDetailsCell"
        static let detailsCellHeight: CGFloat = 360
        static let sectionHeaderIdentifier = "sectionHeader"
        static let sectionHeight: CGFloat = 50
        static let schoolSATCellIdentifier = "schoolSATDetailsCell"
        static let satCellHeight: CGFloat = 180
        static let schoolMapDetailsCellIdentifier = "schoolMapDetailsCell"
        static let mapCellHeight: CGFloat = 250
        static let locationUpdateNotification = "UserLocationAvailable"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = viewModel?.school.schoolName ?? ""
        view.backgroundColor = .white
        setupCollectionView()
        setupLocationManager()
    }
    
    private func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    private func setupCollectionView() {
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.itemSize = CGSize(width: view.frame.size.width, height: Constants.detailsCellHeight)
        collectionViewLayout.headerReferenceSize = CGSize(width: view.frame.size.width, height: Constants.sectionHeight)
        
        collectionViewLayout.scrollDirection = .vertical
        
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: collectionViewLayout)
        
        guard let collectionView = collectionView else {
            return
        }
        
        view.addSubview(collectionView)
        collectionView.autoPinEdgesToSuperviewEdges()
        collectionView.backgroundColor = .white
        collectionView.alwaysBounceVertical = true
        
        collectionView.register(SchoolsDetailsCollectionViewCell.self, forCellWithReuseIdentifier: Constants.schoolDetailsCellIdentifier)
        collectionView.register(SchoolSATDetailsCollectionViewCell.self, forCellWithReuseIdentifier: Constants.schoolSATCellIdentifier)
        collectionView.register(SchoolDetailsMapCollectionViewCell.self, forCellWithReuseIdentifier: Constants.schoolMapDetailsCellIdentifier)
        collectionView.register(SchoolsSectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: Constants.sectionHeaderIdentifier)
        
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
}

extension SchoolDetailsViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sectionsList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.schoolDetailsCellIdentifier, for: indexPath)
            guard let schoolDetailsCell = cell as? SchoolsDetailsCollectionViewCell,
                  let school = viewModel?.school else {
                return cell
            }
            schoolDetailsCell.populate(school)
            return schoolDetailsCell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.schoolSATCellIdentifier, for: indexPath)
            
            guard let schoolSATCell = cell as? SchoolSATDetailsCollectionViewCell,
                  let schoolSAT = viewModel?.schoolSAT else {
                return cell
            }
            
            schoolSATCell.populate(schoolSAT: schoolSAT)
            return cell
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.schoolMapDetailsCellIdentifier, for: indexPath)
            
            guard let mapCell = cell as? SchoolDetailsMapCollectionViewCell,
                  let school = viewModel?.school else {
                return cell
            }
            mapCell.populate(school: school)
            return mapCell
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader,
           let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: Constants.sectionHeaderIdentifier, for: indexPath) as? SchoolsSectionHeaderView{
            sectionHeader.headerLabel.text = sectionsList[indexPath.section]
            return sectionHeader
        }
        return UICollectionReusableView()
    }
    
}

extension SchoolDetailsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.section {
        case 0:
            return CGSize(width: collectionView.bounds.width, height: Constants.detailsCellHeight)
        case 1:
            return CGSize(width: collectionView.bounds.width, height: Constants.satCellHeight)
        default:
            return CGSize(width: collectionView.bounds.width, height: Constants.mapCellHeight)
        }
    }
}

extension SchoolDetailsViewController: UICollectionViewDelegate {
    
}

extension SchoolDetailsViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {
            return
        }
        print(location.coordinate.latitude)
        print(location.coordinate.longitude)
        NotificationCenter.default.post(name: NSNotification.Name(Constants.locationUpdateNotification), object: nil, userInfo: ["userLocation": location])
        
    }
}
