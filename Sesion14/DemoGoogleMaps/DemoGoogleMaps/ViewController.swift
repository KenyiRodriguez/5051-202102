//
//  ViewController.swift
//  DemoGoogleMaps
//
//  Created by Kenyi Rodriguez on 3/12/21.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController {

    @IBOutlet weak var mapView: GMSMapView!
    
    lazy var houseMarker: GMSMarker = {
        let marker = GMSMarker()
        marker.isDraggable = true
        marker.icon = UIImage(systemName: "bus.doubledecker")
        return marker
    }()
    
    lazy var locationManager: CLLocationManager = {
        let locationManager = CLLocationManager()
        locationManager.requestWhenInUseAuthorization()
        return locationManager
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupConfiguration()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.goToUserLocation()
    }
    
    private func setupConfiguration() {
        
        self.locationManager.startUpdatingLocation()
        
        self.mapView.delegate = self
        self.mapView.settings.myLocationButton = true
        self.mapView.settings.compassButton = true
        self.mapView.isMyLocationEnabled = true
        
        let path = GMSPath(fromEncodedPath: "fbzhA`lhuMByFW}Ee@{Cy@eBl@oEjBoOXkCqHiAiEPaEXnAdT")
        let polyline = GMSPolyline(path: path)
        polyline.strokeWidth = 4
        polyline.strokeColor = .systemIndigo
        polyline.map = self.mapView
    }
    
    private func goToUserLocation() {
        guard let userCoordinate = self.locationManager.location?.coordinate else { return }
        self.moveCameraToCoordinate(userCoordinate)
    }
    
    private func moveCameraToCoordinate(_ coordinate: CLLocationCoordinate2D) {
        let camera = GMSCameraPosition(target: coordinate, zoom: 16)
        self.mapView.animate(to: camera)
    }
    
    private func createMarkerToCoordinate(_ coordinate: CLLocationCoordinate2D) {
        let marker = GMSMarker(position: coordinate)
        marker.isDraggable = true
        marker.map = self.mapView
    }
}

extension ViewController: GMSMapViewDelegate {
    
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        self.createMarkerToCoordinate(coordinate)
    }
    
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        
        if marker == self.houseMarker {
            return false
        } else {
            marker.map = nil
            return true
        }
    }
    
    func mapView(_ mapView: GMSMapView, didLongPressAt coordinate: CLLocationCoordinate2D) {
        self.houseMarker.position = coordinate
        self.houseMarker.map = self.mapView
    }
}
